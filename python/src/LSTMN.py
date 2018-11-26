"""Long Short Term Memory Network Classifier python module

website references:
https://www.kaggle.com/ternaryrealm/lstm-time-series-explorations-with-keras"""

import time
import itertools
import os
from os import listdir
from os.path import isfile, join

from numpy import genfromtxt
import numpy as np
from keras.models import Sequential
from keras.layers import LSTM, Dense
from keras.wrappers.scikit_learn import KerasRegressor
from keras.layers.convolutional import Conv1D
from keras.layers.convolutional import MaxPooling1D
from keras.utils import to_categorical
from sklearn.ensemble import AdaBoostClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import StratifiedKFold
from sklearn.model_selection import cross_val_score
import matplotlib.pyplot as plt

# fix random seed for reproducibility
# seed = 7
# np.random.seed(seed)

# Disable tensorflow warning messages
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

# Data Parameters
NUM_CLASS = 4  # Change to two for Healthy vs Diseased binary classification
NUM_FEATURES = 20
NUM_TIME_SERIES = 90000
NUM_TS_CROP = 20000  # time series data cropped by NUM_TS_CROP/2 on start and end
NUM_SKIP_SAMP = 5 # number of time series samples to skip over (after crop)

# Split Parameters
NUM_K_SPLIT = 5  # number k fold to split into training and test
VAL_SPLIT = 0.3  # validation set split from split training set (randomized for each k fold cross validation)

# Run Parameters
NUM_LSTM_CELLS = 50
NUM_EPOCH = 20
BATCH_SIZE = 500

if NUM_CLASS == 4:
    LABEL_CTRL = 0
    LABEL_ALS = 1
    LABEL_HUNT = 2
    LABEL_PARK = 3
    n_outputs = 4
    class_names = ['Control', 'ALS', 'Hunting', 'Parkingson']
else:
    LABEL_CTRL = 0
    LABEL_ALS = 1
    LABEL_HUNT = 1
    LABEL_PARK = 1
    n_outputs = 1
    class_names = ['Healthy', 'Diseased']


def load_data(folder):
    file_list = [f for f in listdir(folder) if isfile(join(folder, f))]

    # Labels for time series data
    y = []

    X_file_list = []

    print('Loading: label | file')
    for file_name in file_list:
        if 'als' in file_name:
            y.append(LABEL_ALS)
            X_file_list.append(file_name)
            print(LABEL_ALS, end='')
        elif 'control' in file_name:
            y.append(LABEL_CTRL)
            X_file_list.append(file_name)
            print(LABEL_CTRL, end='')
        elif 'hunt' in file_name:
            y.append(LABEL_HUNT)
            X_file_list.append(file_name)
            print(LABEL_HUNT, end='')
        elif 'park' in file_name:
            y.append(LABEL_PARK)
            X_file_list.append(file_name)
            print(LABEL_PARK, end='')
        else:
            print('~', end='')
        print(' |', file_name)

    # Time series data, (only using leg 0 for the time being)
    X = np.empty([len(y), NUM_TIME_SERIES, NUM_FEATURES], float)

    for f_i in range(len(X_file_list)):
        if any(x in file_list[f_i] for x in ['als', 'control', 'hunt', 'park']):
            data = genfromtxt(folder + file_list[f_i], delimiter=',')
            X[f_i] = data

    # Crop time series data
    X_crop = X[:, int(NUM_TS_CROP / 2):int(NUM_TIME_SERIES - NUM_TS_CROP / 2), :]

    # Downsample time series data
    X_half = X[:, 0::NUM_SKIP_SAMP, :]

    return X_half, np.asarray(y)


def baseline_model(num_lstm_cells=NUM_LSTM_CELLS, num_time_series=(NUM_TIME_SERIES-NUM_TS_CROP)):
    # The model will be designed in the following manner:
    # LSTM -> 1 sigmoid Dense Layer

    # initialize a sequential keras model
    model = Sequential()

    # Input:
    model.add(Dense(NUM_FEATURES, activation='sigmoid',
                    input_shape=(num_time_series, NUM_FEATURES)))
    # model.add(Dense(int(NUM_FEATURES/2), activation='relu'))
    # model.add(Dense(NUM_CLASS, activation='relu'))
    # model.add(Dense(int(NUM_FEATURES/2), activation='relu'))
    # model.add(Dense(NUM_FEATURES, activation='sigmoid'))

    # CNN 1D
    # model.add(Conv1D(filters=32,
    #                  kernel_size=3,
    #                  padding='same',
    #                  activation='relu',
    #                  input_shape=(num_time_series, NUM_FEATURES)))
    #
    # # Pooling
    # model.add(MaxPooling1D(pool_size=2))

    # LSTM Master Layer
    model.add(LSTM(num_lstm_cells,
                   dropout=0.1,
                   recurrent_dropout=0.1,
                   return_sequences=True
                   # input_shape=(num_time_series, NUM_FEATURES
                   )
              )

    # LSTM Support Layer
    model.add(LSTM(NUM_CLASS))

    # Output: Dense Layer Classifier
    # compile and fit our model
    if NUM_CLASS == 2:
        model.add(Dense(n_outputs, activation='sigmoid'))
        model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

    elif NUM_CLASS == 4:
        model.add(Dense(n_outputs, activation='softmax'))
        model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

    return model


def plot_confusion_matrix(cm, classes,
                          normalize=False,
                          title='Confusion matrix',
                          cmap=plt.cm.Blues):
    """
    This function prints and plots the confusion matrix.
    Normalization can be applied by setting `normalize=True`.
    """
    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("Normalized confusion matrix")
    else:
        print('Confusion matrix, without normalization')

    print(cm)

    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)

    fmt = '.2f' if normalize else 'd'
    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, format(cm[i, j], fmt),
                 horizontalalignment="center",
                 color="white" if cm[i, j] > thresh else "black")

    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.tight_layout()


# Run the following script using the following command via "python -m LSTMN.py"
if __name__ == "__main__":
    # Time Start
    start_time = time.time()

    project_folder = '/media/alexanderfernandes/6686E8B186E882C3/Users/alexanderfernandes/Code/BIOM5405-ClassProject/'
    # project_folder = 'D:/Users/Documents/School/Grad/BIOM5405/project/BIOM5405-ClassProject/'

    X_total, y_total = load_data(project_folder + 'data/')

    print('X_total =', X_total.shape)
    print('y_total = ', y_total.tolist())

    n_timesteps = X_total.shape[1]
    n_features = X_total.shape[2]

    print("Number Classes:", n_outputs)
    print("Cropped Time Series Length:", n_timesteps)
    print("Number Features:", NUM_FEATURES)

    # define 5-fold cross validation test harness
    kfold = StratifiedKFold(n_splits=NUM_K_SPLIT, shuffle=True)
    cvscores = []
    cm_sum = None

    # Bagging
    nbags = 5

    fold_number = 1 # Print logging counter
    for train_index, test_index in kfold.split(X_total, y_total):

        print("CV Fold %d/%d" % (fold_number, NUM_K_SPLIT))
        fold_number += 1

        X_train, X_test = X_total[train_index], X_total[test_index]
        y_train, y_test = y_total[train_index], y_total[test_index]

        if NUM_CLASS == 4:
            y_train = to_categorical(y_train, num_classes=n_outputs)
            y_test = to_categorical(y_test, num_classes=n_outputs)

        print("TRAIN/VAL:", len(train_index), train_index.tolist())
        print("TEST:", len(test_index), test_index.tolist())

        # Split validation set from the training set
        X_train, X_val, y_train, y_val = train_test_split(X_train, y_train, test_size=VAL_SPLIT)

        # Regular Model
        model = baseline_model()
        model.fit(X_train, y_train,
                  validation_data=(X_val, y_val),
                  epochs=NUM_EPOCH,
                  batch_size=BATCH_SIZE,
                  verbose=2)
        scores = model.evaluate(X_test, y_test, verbose=2)
        print("%s: %.2f%%" % (model.metrics_names[1], scores[1] * 100))
        cvscores.append(scores)
        y_pred = model.predict(X_test, batch_size=BATCH_SIZE)

        print("y_test:", y_test)
        print("y_pred:", y_pred)

        # classify output predictions
        if NUM_CLASS == 2:
            y_pred = (y_pred > 0.5)
        elif NUM_CLASS == 4:
            y_ohe = y_pred
            y_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                y_pred.append(mx_i)
            y_ohe = y_test
            y_test = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                y_test.append(mx_i)

        print("y_test:", y_test)
        print("y_pred:", y_pred)

        # confusion matrix
        if cm_sum is None:
            cm_sum = confusion_matrix(y_test, y_pred)
        else:
            cm_sum += confusion_matrix(y_test, y_pred)

    print("%.2f%% (+/- %.2f%%)" % (np.mean(cvscores), np.std(cvscores)))

    # Plot non-normalized confusion matrix
    plt.figure()
    plot_confusion_matrix(cm_sum, classes=class_names, title='Confusion matrix, without normalization')

    # Time End
    elapsed_time = time.time()
    hours, rem = divmod(elapsed_time - start_time, 3600)
    minutes, seconds = divmod(rem, 60)
    print("Elapsed Time: {:0>2}:{:0>2}:{:05.2f}".format(int(hours), int(minutes), seconds))

    plt.show()

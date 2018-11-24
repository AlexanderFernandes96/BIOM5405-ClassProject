"""Long Short Term Memory Network Classifier python module

website references:
https://www.kaggle.com/ternaryrealm/lstm-time-series-explorations-with-keras"""

from os import listdir
from os.path import isfile, join
from numpy import genfromtxt
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from keras.layers.convolutional import Conv1D
from keras.layers.convolutional import MaxPooling1D
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import StratifiedKFold

# fix random seed for reproducibility
seed = 7
np.random.seed(seed)

# Class Labels
LABEL_CTRL = 0
LABEL_ALS = 1
LABEL_HUNT = 1
LABEL_PARK = 1

def load_data(folder):
    file_list = [f for f in listdir(folder) if isfile(join(folder, f))]

    # Labels for time series data
    y = []

    for file_name in file_list:
        if 'als' in file_name:
            y.append(LABEL_ALS)
        elif 'control' in file_name:
            y.append(LABEL_CTRL)
        elif 'hunt' in file_name:
            y.append(LABEL_HUNT)
        elif 'park' in file_name:
            y.append(LABEL_PARK)

    # Time series data, (only using leg 0 for the time being)
    X = np.empty([len(y), 90000, 2], float)

    for i in range(len(file_list)):
        if any(x in file_list[i] for x in ['als', 'control', 'hunt', 'park']):
            data = genfromtxt(folder + file_list[i], delimiter='\t')
            X[i] = data

    return X, np.asarray(y)


# Run the following script using the following command via "python -m LSTMN.py"
if __name__ == "__main__":
    project_folder = '/media/alexanderfernandes/6686E8B186E882C3/Users/alexanderfernandes/Code/BIOM5405-ClassProject/'
    X_total, y_total = load_data(project_folder + 'train/')

    X_train, X_test, y_train, y_test = train_test_split(X_total, y_total, test_size=0.3)

    print('X_total =', X_total.shape)
    print('X_train =', X_train.shape)
    print('X_test =', X_test.shape)

    # The model will be designed in the following manner:
    # CNN 1D -> Pooling -> LSTMN -> 1 sigmoid Dense Layer

    # define 10-fold cross validation test harness
    kfold = StratifiedKFold(n_splits=10, shuffle=True, random_state=seed)
    cvscores = []

    for train, test in kfold.split(X_total, y_total):
        # initialize a sequential keras model
        model = Sequential()

        # CNN 1D
        model.add(Conv1D(filters=32, kernel_size=3, padding='same', activation='relu'))

        # Pooling
        model.add(MaxPooling1D(pool_size=2))

        # LSTM Layer
        num_LSTM_cells = 20
        model.add(LSTM(num_LSTM_cells, dropout=0.2, recurrent_dropout=0.2))

        # classification Dense Layer
        model.add(Dense(1, activation='sigmoid'))

        # compile and fit our model
        model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
        model.fit(X_train, y_train, validation_split=0.2, epochs=15, batch_size=64, verbose=2)

        # evaluate model
        scores = model.evaluate(X_test, y_test, verbose=0)
        print("%s: %.2f%%" % (model.metrics_names[1], scores[1] * 100))
        cvscores.append(scores[1]*100)

        y_pred = (model.predict(X_test, batch_size=64) > 0.5)

    print("%.2f%% (+/- %.2f%%)" % (np.mean(cvscores), np.std(cvscores)))

    # # confusion matrix
    # cm = confusion_matrix(y_test, y_pred)
    # print(cm)











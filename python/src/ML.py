"""Meta Learning Strategy"""
from keras.utils import to_categorical
from scipy.stats import mode
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import StratifiedKFold, train_test_split

import os
import python.src.LSTMN as lstmn
import time
import numpy as np
import matplotlib.pyplot as plt
import random

# Disable tensorflow warning messages
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

# Run the following script using the following command via "python -m ML.py"
if __name__ == "__main__":
    # Time Start
    start_time = time.time()

    project_folder = '/media/alexanderfernandes/6686E8B186E882C3/Users/alexanderfernandes/Code/BIOM5405-ClassProject/'
    # project_folder = 'D:/Users/Documents/School/Grad/BIOM5405/project/BIOM5405-ClassProject/'

    # Meta Learning Classifier Parameters
    tin_lstm_units = 1
    sml_lstm_units = 2
    med_lstm_units = 5
    lrg_lstm_units = 10
    hug_lstm_units = 15

    # LSTMN Parameters:
    lstmn.NUM_CLASS = 4  # Change to two for Healthy vs Diseased binary classification
    lstmn.NUM_EPOCH = 6
    lstmn.BATCH_SIZE = 10

    if lstmn.NUM_CLASS == 4:
        lstmn.LABEL_CTRL = 0
        lstmn.LABEL_ALS = 1
        lstmn.LABEL_HUNT = 2
        lstmn.LABEL_PARK = 3
        lstmn.n_outputs = 4
        class_names = ['Control', 'ALS', 'Hunting', 'Parkingson']
    else:
        lstmn.LABEL_CTRL = 0
        lstmn.LABEL_ALS = 1
        lstmn.LABEL_HUNT = 1
        lstmn.LABEL_PARK = 1
        lstmn.n_outputs = 1
        class_names = ['Healthy', 'Diseased']

    # Load Data
    X_total, y_total = lstmn.load_data(project_folder + 'data/')

    print('X_total =', X_total.shape)
    print('y_total = ', y_total.tolist())

    n_timesteps = X_total.shape[1]
    n_features = X_total.shape[2]
    if lstmn.LABEL_ALS == lstmn.LABEL_HUNT == lstmn.LABEL_PARK:
        # Health vs Diseased
        n_outputs = 1
    else:
        # Classify Disease Type
        n_outputs = 4

    print("Number Classes:", n_outputs)
    print("Cropped Time Series Length:", n_timesteps)
    print("Number Features:", lstmn.NUM_FEATURES)

    # Time series split
    num_classifiers = 5
    n_timesteps = int(n_timesteps / num_classifiers)

    # define 5-fold cross validation test harness
    kfold = StratifiedKFold(n_splits=lstmn.NUM_K_SPLIT, shuffle=True)
    cvscores = []
    cm_sum = None

    fold_number = 1
    for train_index, test_index in kfold.split(X_total, y_total):

        print("\nCV Fold %d/%d" % (fold_number, lstmn.NUM_K_SPLIT))
        fold_number += 1

        X_train, X_test = X_total[train_index], X_total[test_index]
        y_train, y_test = y_total[train_index], y_total[test_index]

        if lstmn.NUM_CLASS == 4:
            y_train = to_categorical(y_train, num_classes=n_outputs)
            y_test = to_categorical(y_test, num_classes=n_outputs)

        print("TRAIN/VAL:", len(train_index), train_index.tolist())
        print("TEST:", len(test_index), test_index.tolist())

        # Split Data from time series axis into equal portions
        X_1_train = np.empty([X_train.shape[0], n_timesteps, lstmn.NUM_FEATURES], float)
        X_2_train = X_1_train
        X_3_train = X_1_train
        X_4_train = X_1_train
        X_5_train = X_1_train

        X_1_test = np.empty([X_test.shape[0], n_timesteps, lstmn.NUM_FEATURES], float)
        X_2_test = X_1_test
        X_3_test = X_1_test
        X_4_test = X_1_test
        X_5_test = X_1_test

        for sub in range(X_train.shape[0]):
            X_1_train[sub, :, :] = X_train[sub, 0*n_timesteps:1*n_timesteps, :]
            X_2_train[sub, :, :] = X_train[sub, 1*n_timesteps:2*n_timesteps, :]
            X_3_train[sub, :, :] = X_train[sub, 2*n_timesteps:3*n_timesteps, :]
            X_4_train[sub, :, :] = X_train[sub, 3*n_timesteps:4*n_timesteps, :]
            X_5_train[sub, :, :] = X_train[sub, 4*n_timesteps:5*n_timesteps, :]
        for sub in range(X_test.shape[0]):
            X_1_test[sub, :, :] = X_test[sub, 0*n_timesteps:1*n_timesteps, :]
            X_2_test[sub, :, :] = X_test[sub, 1*n_timesteps:2*n_timesteps, :]
            X_3_test[sub, :, :] = X_test[sub, 2*n_timesteps:3*n_timesteps, :]
            X_4_test[sub, :, :] = X_test[sub, 3*n_timesteps:4*n_timesteps, :]
            X_5_test[sub, :, :] = X_test[sub, 4*n_timesteps:5*n_timesteps, :]

        y_1_train = y_train
        y_2_train = y_train
        y_3_train = y_train
        y_4_train = y_train
        y_5_train = y_train

        print("Tiny   | train:",  X_1_train.shape, "test:", X_1_test.shape)
        print("Small  | train:",  X_2_train.shape, "test:", X_2_test.shape)
        print("Medium | train:",  X_3_train.shape, "test:", X_3_test.shape)
        print("Large  | train:",  X_4_train.shape, "test:", X_4_test.shape)
        print("Huge   | train:",  X_5_train.shape, "test:", X_5_test.shape)

        # Split validation set from the training set
        X_1_train, X_1_val, y_1_train, y_1_val = train_test_split(X_1_train, y_1_train, test_size=lstmn.VAL_SPLIT)
        X_2_train, X_2_val, y_2_train, y_2_val = train_test_split(X_2_train, y_2_train, test_size=lstmn.VAL_SPLIT)
        X_3_train, X_3_val, y_3_train, y_3_val = train_test_split(X_3_train, y_3_train, test_size=lstmn.VAL_SPLIT)
        X_4_train, X_4_val, y_4_train, y_4_val = train_test_split(X_4_train, y_4_train, test_size=lstmn.VAL_SPLIT)
        X_5_train, X_5_val, y_5_train, y_5_val = train_test_split(X_5_train, y_5_train, test_size=lstmn.VAL_SPLIT)

        # Classifiers: Small, Medium, Large lstmn models
        model_1 = lstmn.baseline_model(tin_lstm_units, n_timesteps)
        model_2 = lstmn.baseline_model(sml_lstm_units, n_timesteps)
        model_3 = lstmn.baseline_model(med_lstm_units, n_timesteps)
        model_4 = lstmn.baseline_model(lrg_lstm_units, n_timesteps)
        model_5 = lstmn.baseline_model(hug_lstm_units, n_timesteps)

        print('Tiny Model', sml_lstm_units, 'units')
        print("X_train:", X_1_train.shape)
        model_1.fit(X_1_train, y_1_train,
                    validation_data=(X_1_val, y_1_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        print('Small Model', sml_lstm_units, 'units')
        print("X_train:", X_2_train.shape)
        model_2.fit(X_2_train, y_2_train,
                    validation_data=(X_2_val, y_2_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        print('Medium Model', med_lstm_units, 'units')
        print("X_train:", X_3_train.shape)
        model_3.fit(X_3_train, y_3_train,
                    validation_data=(X_3_val, y_3_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        print('Large Model', lrg_lstm_units, 'units')
        print("X_train:", X_4_train.shape)
        model_4.fit(X_4_train, y_4_train,
                    validation_data=(X_4_val, y_4_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        print('Large Model', lrg_lstm_units, 'units')
        print("X_train:", X_5_train.shape)
        model_5.fit(X_5_train, y_5_train,
                    validation_data=(X_5_val, y_5_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        model_1_pred = model_1.predict(X_1_test, batch_size=lstmn.BATCH_SIZE)
        model_2_pred = model_2.predict(X_2_test, batch_size=lstmn.BATCH_SIZE)
        model_3_pred = model_3.predict(X_3_test, batch_size=lstmn.BATCH_SIZE)
        model_4_pred = model_4.predict(X_4_test, batch_size=lstmn.BATCH_SIZE)
        model_5_pred = model_5.predict(X_5_test, batch_size=lstmn.BATCH_SIZE)

        # classify output predictions
        if lstmn.NUM_CLASS == 2:
            model_1_pred = (model_1_pred > 0.5)
            model_2_pred = (model_2_pred > 0.5)
            model_3_pred = (model_3_pred > 0.5)
            model_4_pred = (model_4_pred > 0.5)
            model_5_pred = (model_5_pred > 0.5)
        elif lstmn.NUM_CLASS == 4:
            # Tiny Prediction
            y_ohe = model_1_pred
            model_1_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_1_pred.append(mx_i)
            # Small Prediction
            y_ohe = model_2_pred
            model_2_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_2_pred.append(mx_i)
            # Medium Prediction
            y_ohe = model_3_pred
            model_3_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_3_pred.append(mx_i)
            # Large Prediction
            y_ohe = model_4_pred
            model_4_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_4_pred.append(mx_i)
            # Huge Prediction
            y_ohe = model_5_pred
            model_5_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_5_pred.append(mx_i)
            # Actual
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

        print("y_test:     ", y_test)
        print("Tiny   pred:", model_1_pred)
        print("Small  pred:", model_2_pred)
        print("Medium pred:", model_3_pred)
        print("Large  pred:", model_4_pred)
        print("Huge   pred:", model_5_pred)

        final_pred = np.array([])
        for i in range(0, len(X_test)):
            max_vote = mode([model_1_pred[i],
                             model_2_pred[i],
                             model_3_pred[i],
                             model_4_pred[i],
                             model_5_pred[i]])
            final_pred = np.append(final_pred, max_vote[0])

        print("final_pred: ", final_pred)

        # confusion matrix
        cm = confusion_matrix(y_test, final_pred)
        if cm_sum is None:
            cm_sum = cm
        else:
            cm_sum += cm

        score = 0
        sum = 0
        for r in range(cm.shape[0]):
            for c in range(cm.shape[1]):
                sum += cm[r, c]
                if r == c:
                    score += cm[r, c]
        score = score * 100 / sum
        print("score: %.2f%%" % score)
        cvscores.append(score)

    print("\nCross Fold Classification Accuracy:\n%.2f%% (+/- %.2f%%)" % (np.mean(cvscores), np.std(cvscores)))

    # Plot non-normalized confusion matrix
    plt.figure()
    lstmn.plot_confusion_matrix(cm_sum, classes=class_names, title='Confusion matrix, without normalization')

    # Time End
    elapsed_time = time.time()
    hours, rem = divmod(elapsed_time - start_time, 3600)
    minutes, seconds = divmod(rem, 60)
    print("Elapsed Time: {:0>2}:{:0>2}:{:05.2f}".format(int(hours), int(minutes), seconds))

    plt.show()

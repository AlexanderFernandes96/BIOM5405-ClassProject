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
    sml_lstm_units = 10
    med_lstm_units = 50
    lrg_lstm_units = 100

    # LSTMN Parameters:
    lstmn.NUM_CLASS = 4  # Change to two for Healthy vs Diseased binary classification
    lstmn.NUM_EPOCH = 15
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

        # Bootstrap new data for each classifier
        X_s_train = X_train;
        y_s_train = y_train
        X_m_train = X_train;
        y_m_train = y_train
        X_l_train = X_train;
        y_l_train = y_train
        for i in range(0, len(X_train)):
            s = random.randint(0, len(X_train) - 1)
            X_s_train[i] = X_train[s]
            y_s_train[i] = y_train[s]

            m = random.randint(0, len(X_train) - 1)
            X_m_train[i] = X_train[m]
            y_m_train[i] = y_train[m]

            l = random.randint(0, len(X_train) - 1)
            X_l_train[i] = X_train[l]
            y_l_train[i] = y_train[l]

        # Split validation set from the training set
        X_s_train, X_s_val, y_s_train, y_s_val = train_test_split(X_s_train, y_s_train, test_size=lstmn.VAL_SPLIT)
        X_m_train, X_m_val, y_m_train, y_m_val = train_test_split(X_m_train, y_m_train, test_size=lstmn.VAL_SPLIT)
        X_l_train, X_l_val, y_l_train, y_l_val = train_test_split(X_l_train, y_l_train, test_size=lstmn.VAL_SPLIT)

        # Classifiers: Small, Medium, Large lstmn models
        model_s = lstmn.baseline_model(sml_lstm_units)
        model_m = lstmn.baseline_model(med_lstm_units)
        model_l = lstmn.baseline_model(lrg_lstm_units)

        print('Small Model', sml_lstm_units, 'units')
        model_s.fit(X_s_train,
                    y_s_train,
                    validation_data=(X_s_val, y_s_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)
        print('Medium Model', med_lstm_units, 'units')
        model_m.fit(X_m_train,
                    y_m_train,
                    validation_data=(X_m_val, y_m_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)
        print('Large Model', lrg_lstm_units, 'units')
        model_l.fit(X_l_train,
                    y_l_train,
                    validation_data=(X_l_val, y_l_val),
                    epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=2)

        model_s_pred = model_s.predict(X_test, batch_size=lstmn.BATCH_SIZE)
        model_m_pred = model_m.predict(X_test, batch_size=lstmn.BATCH_SIZE)
        model_l_pred = model_l.predict(X_test, batch_size=lstmn.BATCH_SIZE)

        # classify output predictions
        if lstmn.NUM_CLASS == 2:
            model_s_pred = (model_s_pred > 0.5)
            model_m_pred = (model_m_pred > 0.5)
            model_l_pred = (model_l_pred > 0.5)
        elif lstmn.NUM_CLASS == 4:
            # Small Prediction
            y_ohe = model_s_pred
            model_s_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_s_pred.append(mx_i)
            # Medium Prediction
            y_ohe = model_m_pred
            model_m_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_m_pred.append(mx_i)
            # Large Prediction
            y_ohe = model_l_pred
            model_l_pred = []
            for y in y_ohe:
                mx = 0
                mx_i = None
                for i in range(4):
                    if y[i] > mx:
                        mx_i = i
                        mx = y[i]
                model_l_pred.append(mx_i)
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

        print("y_test:      ", y_test)
        print("model_s_pred:", model_s_pred)
        print("model_m_pred:", model_m_pred)
        print("model_l_pred:", model_l_pred)

        final_pred = np.array([])
        for i in range(0, len(X_test)):
            max_vote = mode([model_s_pred[i], model_m_pred[i], model_l_pred[i]])
            final_pred = np.append(final_pred, max_vote[0])

        print("final_pred:  ", final_pred)

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

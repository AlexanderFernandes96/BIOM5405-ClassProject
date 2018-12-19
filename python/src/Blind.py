"""Predict Blind data"""
from keras import Model
from keras.layers import Dense
from keras.layers.merge import concatenate
from keras.utils import to_categorical
from scipy.stats import mode
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import StratifiedKFold, train_test_split
import os
from sklearn.utils import resample
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

    # # LSTMN Parameters:
    # lstmn.NUM_CLASS = 2  # Change to two for Healthy vs Diseased binary classification
    # lstmn.NUM_EPOCH = 500
    # lstmn.BATCH_SIZE = 500
    # lstmn.NUM_SKIP_SAMP = 10
    #
    # # Meta Learning Classifier Parameters
    # tin_lstm_units = 2
    # sml_lstm_units = 10
    # med_lstm_units = 25
    # lrg_lstm_units = 50
    # hug_lstm_units = 100
    #
    # if lstmn.NUM_CLASS == 4:
    #     lstmn.LABEL_CTRL = 0
    #     lstmn.LABEL_ALS = 1
    #     lstmn.LABEL_HUNT = 2
    #     lstmn.LABEL_PARK = 3
    #     lstmn.n_outputs = 4
    #     class_names = ['Control', 'ALS', 'Hunting', 'Parkingson']
    # else:
    #     lstmn.LABEL_CTRL = 0
    #     lstmn.LABEL_ALS = 1
    #     lstmn.LABEL_HUNT = 1
    #     lstmn.LABEL_PARK = 1
    #     lstmn.n_outputs = 1
    #     class_names = ['Healthy', 'Diseased']
    #
    # # Load Data
    # X_total, y_total, B_total = lstmn.load_data(project_folder + 'data/')
    #
    # print('X_total =', X_total.shape)
    # print('B_total =', B_total.shape)
    # print('y_total = ', y_total.tolist())
    #
    # n_timesteps = X_total.shape[1]
    # n_features = X_total.shape[2]
    # if lstmn.LABEL_ALS == lstmn.LABEL_HUNT == lstmn.LABEL_PARK:
    #     # Health vs Diseased
    #     n_outputs = 1
    # else:
    #     # Classify Disease Type
    #     n_outputs = 4
    #
    # print("Number Classes:", n_outputs)
    # print("Cropped Time Series Length:", n_timesteps)
    # print("Number Features:", lstmn.NUM_FEATURES)
    #
    # X_train, y_train = X_total, y_total
    #
    # if lstmn.NUM_CLASS == 4:
    #     y_train = to_categorical(y_train, num_classes=n_outputs)
    #
    # # Bootstrapping
    # nbootstrap = X_train.shape[0] * 3
    # X_1_seed = np.random.choice(X_train.shape[0], nbootstrap)
    # X_2_seed = np.random.choice(X_train.shape[0], nbootstrap)
    # X_3_seed = np.random.choice(X_train.shape[0], nbootstrap)
    # X_4_seed = np.random.choice(X_train.shape[0], nbootstrap)
    # X_5_seed = np.random.choice(X_train.shape[0], nbootstrap)
    #
    # X_1_train = np.empty([nbootstrap, n_timesteps, lstmn.NUM_FEATURES], float)
    # X_2_train = X_1_train
    # X_3_train = X_1_train
    # X_4_train = X_1_train
    # X_5_train = X_1_train
    #
    # X_1_test = B_total
    # X_2_test = B_total
    # X_3_test = B_total
    # X_4_test = B_total
    # X_5_test = B_total
    #
    # if lstmn.NUM_CLASS == 4:
    #     y_1_train = np.empty([nbootstrap, 4])
    # elif lstmn.NUM_CLASS == 2:
    #     y_1_train = np.empty([nbootstrap, 1])
    #
    # y_2_train = y_1_train
    # y_3_train = y_1_train
    # y_4_train = y_1_train
    # y_5_train = y_1_train
    #
    # for b in range(nbootstrap):
    #     X_1_train[b, :, :] = X_train[X_1_seed[b], :, :]
    #     X_2_train[b, :, :] = X_train[X_2_seed[b], :, :]
    #     X_3_train[b, :, :] = X_train[X_3_seed[b], :, :]
    #     X_4_train[b, :, :] = X_train[X_4_seed[b], :, :]
    #     X_5_train[b, :, :] = X_train[X_5_seed[b], :, :]
    #     y_1_train[b] = y_train[X_1_seed[b]]
    #     y_2_train[b] = y_train[X_2_seed[b]]
    #     y_3_train[b] = y_train[X_3_seed[b]]
    #     y_4_train[b] = y_train[X_4_seed[b]]
    #     y_5_train[b] = y_train[X_5_seed[b]]
    #
    # print("Bootstrap Sample Set:")
    # print("Tiny   | train:",  X_1_train.shape, "test:", X_1_test.shape)
    # print("Small  | train:",  X_2_train.shape, "test:", X_2_test.shape)
    # print("Medium | train:",  X_3_train.shape, "test:", X_3_test.shape)
    # print("Large  | train:",  X_4_train.shape, "test:", X_4_test.shape)
    # print("Huge   | train:",  X_5_train.shape, "test:", X_5_test.shape)
    #
    # # Classifiers: Tiny, Small, Medium, Large, Huge lstmn models
    # model_1 = lstmn.baseline_model(tin_lstm_units, n_timesteps)
    # model_2 = lstmn.baseline_model(sml_lstm_units, n_timesteps)
    # model_3 = lstmn.baseline_model(med_lstm_units, n_timesteps)
    # model_4 = lstmn.baseline_model(lrg_lstm_units, n_timesteps)
    # model_5 = lstmn.baseline_model(hug_lstm_units, n_timesteps)
    #
    # # Max Voting
    # # Split validation set from the training set
    # X_1_train, X_1_val, y_1_train, y_1_val = train_test_split(X_1_train, y_1_train, test_size=lstmn.VAL_SPLIT)
    # X_2_train, X_2_val, y_2_train, y_2_val = train_test_split(X_2_train, y_2_train, test_size=lstmn.VAL_SPLIT)
    # X_3_train, X_3_val, y_3_train, y_3_val = train_test_split(X_3_train, y_3_train, test_size=lstmn.VAL_SPLIT)
    # X_4_train, X_4_val, y_4_train, y_4_val = train_test_split(X_4_train, y_4_train, test_size=lstmn.VAL_SPLIT)
    # X_5_train, X_5_val, y_5_train, y_5_val = train_test_split(X_5_train, y_5_train, test_size=lstmn.VAL_SPLIT)
    # print('Tiny Model', tin_lstm_units, 'units')
    # print("X_train:", X_1_train.shape)
    # model_1.fit(X_1_train, y_1_train,
    #             validation_data=(X_1_val, y_1_val),
    #             epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)
    #
    # print('Small Model', sml_lstm_units, 'units')
    # print("X_train:", X_2_train.shape)
    # model_2.fit(X_2_train, y_2_train,
    #             validation_data=(X_2_val, y_2_val),
    #             epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)
    #
    # print('Medium Model', med_lstm_units, 'units')
    # print("X_train:", X_3_train.shape)
    # model_3.fit(X_3_train, y_3_train,
    #             validation_data=(X_3_val, y_3_val),
    #             epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)
    #
    # print('Large Model', lrg_lstm_units, 'units')
    # print("X_train:", X_4_train.shape)
    # model_4.fit(X_4_train, y_4_train,
    #             validation_data=(X_4_val, y_4_val),
    #             epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)
    #
    # print('Huge Model', hug_lstm_units, 'units')
    # print("X_train:", X_5_train.shape)
    # model_5.fit(X_5_train, y_5_train,
    #             validation_data=(X_5_val, y_5_val),
    #             epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)
    #
    # model_1_pred = model_1.predict(X_1_test, batch_size=lstmn.BATCH_SIZE)
    # model_2_pred = model_2.predict(X_2_test, batch_size=lstmn.BATCH_SIZE)
    # model_3_pred = model_3.predict(X_3_test, batch_size=lstmn.BATCH_SIZE)
    # model_4_pred = model_4.predict(X_4_test, batch_size=lstmn.BATCH_SIZE)
    # model_5_pred = model_5.predict(X_5_test, batch_size=lstmn.BATCH_SIZE)
    # #
    # # classify output predictions
    # if lstmn.NUM_CLASS == 2:
    #     model_1_pred = (model_1_pred > 0.5)
    #     model_2_pred = (model_2_pred > 0.5)
    #     model_3_pred = (model_3_pred > 0.5)
    #     model_4_pred = (model_4_pred > 0.5)
    #     model_5_pred = (model_5_pred > 0.5)
    # elif lstmn.NUM_CLASS == 4:
    #     # Tiny Prediction
    #     y_ohe = model_1_pred
    #     model_1_pred = []
    #     for y in y_ohe:
    #         mx = 0
    #         mx_i = None
    #         for i in range(4):
    #             if y[i] > mx:
    #                 mx_i = i
    #                 mx = y[i]
    #         model_1_pred.append(mx_i)
    #     # Small Prediction
    #     y_ohe = model_2_pred
    #     model_2_pred = []
    #     for y in y_ohe:
    #         mx = 0
    #         mx_i = None
    #         for i in range(4):
    #             if y[i] > mx:
    #                 mx_i = i
    #                 mx = y[i]
    #         model_2_pred.append(mx_i)
    #     # Medium Prediction
    #     y_ohe = model_3_pred
    #     model_3_pred = []
    #     for y in y_ohe:
    #         mx = 0
    #         mx_i = None
    #         for i in range(4):
    #             if y[i] > mx:
    #                 mx_i = i
    #                 mx = y[i]
    #         model_3_pred.append(mx_i)
    #     # Large Prediction
    #     y_ohe = model_4_pred
    #     model_4_pred = []
    #     for y in y_ohe:
    #         mx = 0
    #         mx_i = None
    #         for i in range(4):
    #             if y[i] > mx:
    #                 mx_i = i
    #                 mx = y[i]
    #         model_4_pred.append(mx_i)
    #     # Huge Prediction
    #     y_ohe = model_5_pred
    #     model_5_pred = []
    #     for y in y_ohe:
    #         mx = 0
    #         mx_i = None
    #         for i in range(4):
    #             if y[i] > mx:
    #                 mx_i = i
    #                 mx = y[i]
    #         model_5_pred.append(mx_i)
    #
    # print("Tiny   pred:", model_1_pred)
    # print("Small  pred:", model_2_pred)
    # print("Medium pred:", model_3_pred)
    # print("Large  pred:", model_4_pred)
    # print("Huge   pred:", model_5_pred)
    #
    # final_2_pred = np.array([])
    # for i in range(0, len(B_total)):
    #     maj_vote = mode([model_1_pred[i],
    #                      model_2_pred[i],
    #                      model_3_pred[i],
    #                      model_4_pred[i],
    #                      model_5_pred[i]])
    #     final_2_pred = np.append(final_2_pred, maj_vote[0])

    # LSTMN Parameters:
    lstmn.NUM_CLASS = 4  # Change to two for Healthy vs Diseased binary classification
    lstmn.NUM_EPOCH = 500
    lstmn.BATCH_SIZE = 500
    lstmn.NUM_SKIP_SAMP = 5

    # Meta Learning Classifier Parameters
    tin_lstm_units = 2
    sml_lstm_units = 10
    med_lstm_units = 25
    lrg_lstm_units = 50
    hug_lstm_units = 100

    if lstmn.NUM_CLASS == 4:
        lstmn.LABEL_CTRL = 0
        lstmn.LABEL_ALS = 1
        lstmn.LABEL_HUNT = 2
        lstmn.LABEL_PARK = 3
        lstmn.n_outputs = 4
        LBL_CTRL = 0
        LBL_ALS = 1
        LBL_HUNT = 2
        LBL_PARK = 3
        class_names = ['Control', 'ALS', 'Hunting', 'Parkingson']
    else:
        lstmn.LABEL_CTRL = 0
        lstmn.LABEL_ALS = 1
        lstmn.LABEL_HUNT = 1
        lstmn.LABEL_PARK = 1
        lstmn.n_outputs = 1
        LBL_CTRL = 0
        LBL_ALS = 1
        LBL_HUNT = 1
        LBL_PARK = 1
        class_names = ['Healthy', 'Diseased']

    # Load Data
    X_total, y_total, B_total = lstmn.load_data(project_folder + 'data/')

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

    X_train, y_train = X_total, y_total

    if lstmn.NUM_CLASS == 4:
        y_train = to_categorical(y_train, num_classes=n_outputs)

    # Bootstrapping
    nbootstrap = X_train.shape[0] * 3
    X_1_seed = np.random.choice(X_train.shape[0], nbootstrap)
    X_2_seed = np.random.choice(X_train.shape[0], nbootstrap)
    X_3_seed = np.random.choice(X_train.shape[0], nbootstrap)
    X_4_seed = np.random.choice(X_train.shape[0], nbootstrap)
    X_5_seed = np.random.choice(X_train.shape[0], nbootstrap)

    X_1_train = np.empty([nbootstrap, n_timesteps, lstmn.NUM_FEATURES], float)
    X_2_train = X_1_train
    X_3_train = X_1_train
    X_4_train = X_1_train
    X_5_train = X_1_train

    X_1_test = B_total
    X_2_test = B_total
    X_3_test = B_total
    X_4_test = B_total
    X_5_test = B_total

    if lstmn.NUM_CLASS == 4:
        y_1_train = np.empty([nbootstrap, 4])
    elif lstmn.NUM_CLASS == 2:
        y_1_train = np.empty([nbootstrap, 1])

    y_2_train = y_1_train
    y_3_train = y_1_train
    y_4_train = y_1_train
    y_5_train = y_1_train

    for b in range(nbootstrap):
        X_1_train[b, :, :] = X_train[X_1_seed[b], :, :]
        X_2_train[b, :, :] = X_train[X_2_seed[b], :, :]
        X_3_train[b, :, :] = X_train[X_3_seed[b], :, :]
        X_4_train[b, :, :] = X_train[X_4_seed[b], :, :]
        X_5_train[b, :, :] = X_train[X_5_seed[b], :, :]
        y_1_train[b] = y_train[X_1_seed[b]]
        y_2_train[b] = y_train[X_2_seed[b]]
        y_3_train[b] = y_train[X_3_seed[b]]
        y_4_train[b] = y_train[X_4_seed[b]]
        y_5_train[b] = y_train[X_5_seed[b]]

    print("Bootstrap Sample Set:")
    print("Tiny   | train:",  X_1_train.shape, "test:", X_1_test.shape)
    print("Small  | train:",  X_2_train.shape, "test:", X_2_test.shape)
    print("Medium | train:",  X_3_train.shape, "test:", X_3_test.shape)
    print("Large  | train:",  X_4_train.shape, "test:", X_4_test.shape)
    print("Huge   | train:",  X_5_train.shape, "test:", X_5_test.shape)

    # Classifiers: Tiny, Small, Medium, Large, Huge lstmn models
    model_1 = lstmn.baseline_model(tin_lstm_units, n_timesteps)
    model_2 = lstmn.baseline_model(sml_lstm_units, n_timesteps)
    model_3 = lstmn.baseline_model(med_lstm_units, n_timesteps)
    model_4 = lstmn.baseline_model(lrg_lstm_units, n_timesteps)
    model_5 = lstmn.baseline_model(hug_lstm_units, n_timesteps)

    # Max Voting
    # Split validation set from the training set
    X_1_train, X_1_val, y_1_train, y_1_val = train_test_split(X_1_train, y_1_train, test_size=lstmn.VAL_SPLIT)
    X_2_train, X_2_val, y_2_train, y_2_val = train_test_split(X_2_train, y_2_train, test_size=lstmn.VAL_SPLIT)
    X_3_train, X_3_val, y_3_train, y_3_val = train_test_split(X_3_train, y_3_train, test_size=lstmn.VAL_SPLIT)
    X_4_train, X_4_val, y_4_train, y_4_val = train_test_split(X_4_train, y_4_train, test_size=lstmn.VAL_SPLIT)
    X_5_train, X_5_val, y_5_train, y_5_val = train_test_split(X_5_train, y_5_train, test_size=lstmn.VAL_SPLIT)
    print('Tiny Model', tin_lstm_units, 'units')
    print("X_train:", X_1_train.shape)
    model_1.fit(X_1_train, y_1_train,
                validation_data=(X_1_val, y_1_val),
                epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)

    print('Small Model', sml_lstm_units, 'units')
    print("X_train:", X_2_train.shape)
    model_2.fit(X_2_train, y_2_train,
                validation_data=(X_2_val, y_2_val),
                epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)

    print('Medium Model', med_lstm_units, 'units')
    print("X_train:", X_3_train.shape)
    model_3.fit(X_3_train, y_3_train,
                validation_data=(X_3_val, y_3_val),
                epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)

    print('Large Model', lrg_lstm_units, 'units')
    print("X_train:", X_4_train.shape)
    model_4.fit(X_4_train, y_4_train,
                validation_data=(X_4_val, y_4_val),
                epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)

    print('Huge Model', hug_lstm_units, 'units')
    print("X_train:", X_5_train.shape)
    model_5.fit(X_5_train, y_5_train,
                validation_data=(X_5_val, y_5_val),
                epochs=lstmn.NUM_EPOCH, batch_size=lstmn.BATCH_SIZE, verbose=0)

    model_1_pred = model_1.predict(X_1_test, batch_size=lstmn.BATCH_SIZE)
    model_2_pred = model_2.predict(X_2_test, batch_size=lstmn.BATCH_SIZE)
    model_3_pred = model_3.predict(X_3_test, batch_size=lstmn.BATCH_SIZE)
    model_4_pred = model_4.predict(X_4_test, batch_size=lstmn.BATCH_SIZE)
    model_5_pred = model_5.predict(X_5_test, batch_size=lstmn.BATCH_SIZE)
    #
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

    print("Tiny   pred:", model_1_pred)
    print("Small  pred:", model_2_pred)
    print("Medium pred:", model_3_pred)
    print("Large  pred:", model_4_pred)
    print("Huge   pred:", model_5_pred)

    final_4_pred = np.array([])
    for i in range(0, len(B_total)):
        p = [model_1_pred[i], model_2_pred[i], model_3_pred[i], model_4_pred[i], model_5_pred[i]]
        maj_vote = mode([x for x in p if x is not None])
        final_4_pred = np.append(final_4_pred, maj_vote[0])


    for p in range(len(final_4_pred)):
        # if final_2_pred[p] == LBL_CTRL:
        #     c2 = 'H'
        # elif final_2_pred[p] == LBL_ALS:
        #     c2 = 'D'

        if final_4_pred[p] == LBL_CTRL:
            c4 = 'H'
        elif final_4_pred[p] == LBL_ALS:
            c4 = 'ALS'
        elif final_4_pred[p] == LBL_HUNT:
            c4 = 'HD'
        elif final_4_pred[p] == LBL_PARK:
            c4 = 'PD'
        # print("blind", p+1, ', ', c2, ', ', c4, sep='')
        print("blind", p+1, c4, sep='')


    # Time End
    elapsed_time = time.time()
    hours, rem = divmod(elapsed_time - start_time, 3600)
    minutes, seconds = divmod(rem, 60)
    print("Elapsed Time: {:0>2}:{:0>2}:{:05.2f}".format(int(hours), int(minutes), seconds))
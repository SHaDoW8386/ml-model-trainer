from django.shortcuts import render, HttpResponse
from .serializers import *
from .models import *
from Authentication.models import *
import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, LogisticRegression, Lasso, Ridge
from sklearn.preprocessing import OrdinalEncoder
from sklearn.ensemble import RandomForestClassifier, VotingClassifier,  BaggingClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.ensemble import RandomForestRegressor, VotingRegressor, BaggingRegressor, AdaBoostRegressor, GradientBoostingRegressor
from sklearn.tree import DecisionTreeClassifier, DecisionTreeRegressor
from sklearn.compose import ColumnTransformer
from sklearn.naive_bayes import BernoulliNB, ComplementNB, MultinomialNB, GaussianNB
from joblib import Parallel, delayed
import joblib
import pickle
from io import StringIO
from django.core.files.base import ContentFile
import csv

def Save_csv(model_D, data, t_data, Dtype):
    csv_buffer = StringIO()
    csv_writer = csv.writer(csv_buffer)
    csv_writer.writerow(data.columns)
    for x in t_data:
      csv_writer.writerow(x)
    csv_file = ContentFile(csv_buffer.getvalue().encode('utf-8'))
    if Dtype == "x_train":
        model_D.TRAIN_X.save(f'{model_D.BID}_x_train.csv', csv_file)
    elif Dtype == "x_test":
        model_D.TEST_X.save(f'{model_D.BID}_x_test.csv', csv_file)
    elif Dtype == "y_train":
        model_D.TRAIN_Y.save(f'{model_D.BID}_y_train.csv', csv_file)
    elif Dtype == "y_test":
        model_D.TEST_Y.save(f'{model_D.BID}_y_test.csv', csv_file)

def Read_csv(model_D):
    x_train = pd.read_csv(model_D.TRAIN_X, header=1)
    x_train = x_train.to_numpy()

    x_test = pd.read_csv(model_D.TEST_X, header=1)
    x_test = x_test.to_numpy()

    y_train = pd.read_csv(model_D.TRAIN_Y, header=1)
    y_train = y_train.to_numpy()

    y_test = pd.read_csv(model_D.TEST_Y, header=1)
    y_test = y_test.to_numpy()

    return x_train, x_test, y_train, y_test


def Decoders(model_D):

    x_decoder = pickle.load(model_D.F_ENCODER.open('rb'))
    y_decoder = pickle.load(model_D.T_ENCODER.open('rb'))
    model_D.F_ENCODER.close()
    model_D.T_ENCODER.close()
    # with open(model_D.F_ENCODER, "rb") as fileX:
    #     x_decoder = pickle.load(fileX)

    # with open(model_D.T_ENCODER, "rb") as fileY:
    #     y_decoder = pickle.load(fileY)

    return x_decoder, y_decoder


def Encoders(bid = None, X=None, Y=None, model_D=None ):

    # model_D = BuildMLModel.objects.get(BID = bid)
    transformer_X = ColumnTransformer(transformers=[('ord', OrdinalEncoder(), list(X.columns))], remainder="passthrough") # remainder passthrough means that all not mentioned columns will not be touched.
    transformed_X = transformer_X.fit_transform(X)
    transformer_Y = ColumnTransformer(transformers=[('ord', OrdinalEncoder(), list(Y.columns))], remainder="passthrough") # remainder passthrough means that all not mentioned columns will not be touched.
    transformed_Y = transformer_Y.fit_transform(Y)

    content_X = pickle.dumps(transformer_X)
    fid_x = ContentFile(content_X)
    model_D.F_ENCODER.save(f"{bid}_F_encoder.pkl", fid_x)
    fid_x.close()

    content_Y = pickle.dumps(transformer_Y)
    fid_y = ContentFile(content_Y)
    model_D.T_ENCODER.save(f"{bid}_T_encoder.pkl", fid_y)
    fid_y.close()
    return transformed_X, transformed_Y

def Save_Model(model_D, model):
    modelP = pickle.dumps(model)
    modelC = ContentFile(modelP)
    model_D.MODEL.save(f"{model_D.BID}_{model_D.MODELID}_model.pkl", modelC)
    modelC.close()



def TrainTestSplit(request):
    if request.method == 'POST':
        data = request.GET
        bid = data.get('bid',None)
        target = request.POST.get('target')
        print(bid)
        testSize = float(int(request.POST.get('test_size'))/100)
        if bid:
            modelData = BuildMLModel.objects.get(BID = bid)
            dataset = pd.read_csv(modelData.DATASET).dropna()
            y = dataset[[target]]
            x = dataset.drop(target,axis=1)
            X, Y = Encoders(bid, x, y, modelData)
            x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size=testSize)
            Save_csv(modelData, x, x_train, "x_train")
            Save_csv(modelData, x, x_test, "x_test")
            Save_csv(modelData, y, y_train, "y_train")
            Save_csv(modelData, y, y_test, "y_test")
            MLModels = MLModelSerializer(MachineLearningModel.objects.get(MODELID = modelData.MODELID)).data
        return render(request, 'Build/TrainModel.html', context = {"mlmodel" : MLModels, "mlbuild": modelData})
    else:
        modelData = BuildMLModel.objects.get(BID = request.GET['bid'])
        datasetC = pd.read_csv(modelData.DATASET).columns
        return render(request, 'Build/TrainTestSplit.html', context={"bid":request.GET['bid'], "col":datasetC})


def MLLogisticRegression(request):
    params = request.POST
    n_jobs=params.get('n_jobs', None),
    penalty=params.get('penalty', 'l2'),
    dual=params.get('dual', False),
    tol=params.get('tol', 1e-4),
    C=params.get('C', 1.0),
    intercept_scaling=params.get('intercept_scaling', 1),
    class_weight=params.get('class_weight', None),
    random_state=params.get('random_state', None),
    solver=params.get('solver', 'lbfgs'),
    max_iter=params.get('max_iter', 100),
    multi_class=params.get('multi_class', 'auto'),
    verbose=params.get('verbose', 0),
    warm_start=params.get('warm_start', False),
    l1_ratio=params.get('l1_ratio', None)

    bid = params.get('bid')

    model = LogisticRegression(
        n_jobs= None if eval(n_jobs[0]) is None else int(n_jobs[0]),
        penalty=penalty[0],
        dual=eval(dual[0]),
        tol=float(tol[0]),
        C=float(C[0]),
        intercept_scaling=eval(intercept_scaling[0]),
        class_weight=None,
        random_state=None if eval(random_state[0]) is None else int(random_state[0]),
        solver=solver[0],
        max_iter=int(max_iter[0]),
        multi_class=multi_class[0],
        verbose=int(verbose[0]),
        warm_start=eval(warm_start[0]),
        # l1_ratio=None if eval(l1_ratio[0]) is None else float(l1_ratio[0]),
    )

    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})



def MLLinearRegression(request):
    params = request.POST
    n_jobs=params.get('n_jobs', None)
    fit_intercept=params.get('fit_intercept', True)
    copy_X=params.get('copy_X', True)
    positive=params.get('positive', False)


    bid = params.get('bid')

    model = LinearRegression(
        fit_intercept=eval(fit_intercept),
        copy_X=eval(copy_X),
        n_jobs= None if eval(n_jobs) is None else int(n_jobs),
        positive=eval(positive)
    )

    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})


def MLRandomForestClassifier(request):
    params = request.POST
    n_jobs=params.get('n_jobs', None)
    class_weight=params.get('class_weight', None)
    random_state=params.get('random_state', None)
    verbose=params.get('verbose', 0)
    warm_start=params.get('warm_start', False)
    n_estimators=params.get('n_estimators', 100)
    criterion=params.get('criterion', 'gini')
    max_depth=params.get('max_depth', None) 
    min_samples_split=params.get('min_samples_split', 2) 
    min_samples_leaf=params.get('min_samples_leaf', 1) 
    min_weight_fraction_leaf=params.get('min_weight_fraction_leaf', 0.0) 
    max_features=params.get('max_features', 'sqrt'),
    max_leaf_nodes=params.get('max_leaf_nodes', None) 
    min_impurity_decrease=params.get('min_impurity_decrease', 0.0) 
    bootstrap=params.get('bootstrap', True) 
    oob_score=params.get('oob_score', False)
    ccp_alpha=params.get('ccp_alpha', 0.0) 
    max_samples=params.get('max_samples', None)

    bid = params.get('bid')

    model = RandomForestClassifier(
        # n_jobs= None if eval(n_jobs[0]) is None else int(n_jobs[0]),
        # class_weight=None,
        # random_state=None if eval(random_state) is None else int(random_state),
        # verbose=int(verbose[0]),
        # warm_start=eval(warm_start),
        # n_estimators=int(n_estimators),
        # criterion=criterion,
        # max_depth=None if eval(max_depth) is None else int(max_depth), 
        # min_samples_split=float(min_samples_split), 
        # min_samples_leaf=float(min_samples_leaf), 
        # min_weight_fraction_leaf=float(min_weight_fraction_leaf), 
        # max_features=None if eval(max_features) is None else str(max_features),
        # max_leaf_nodes=None if eval(max_leaf_nodes) is None else float(max_leaf_nodes),
        # min_impurity_decrease=None if eval(min_impurity_decrease) is None else float(min_impurity_decrease),
        # bootstrap=eval(bootstrap), 
        # oob_score=eval(oob_score),
        # ccp_alpha=None if eval(ccp_alpha) is None else float(ccp_alpha),
        # max_samples=None if eval(max_samples) is None else float(max_samples),
    )

    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLRandomForestRegressor(request):
    params = request.POST
    n_jobs=params.get('n_jobs', 'None')
    random_state=params.get('random_state', 'None')
    verbose=params.get('verbose', 0)
    warm_start=params.get('warm_start', 'False')
    n_estimators=params.get('n_estimators', 100)
    criterion=params.get('criterion', 'squared_error')
    max_depth=params.get('max_depth', 'None') 
    min_samples_split=1
    min_samples_leaf=params.get('min_samples_leaf', 1) 
    min_weight_fraction_leaf=params.get('min_weight_fraction_leaf', 0.0) 
    max_features=params.get('max_features', 'sqrt'),
    max_leaf_nodes=params.get('max_leaf_nodes', 'None') 
    min_impurity_decrease=params.get('min_impurity_decrease', 0.0) 
    bootstrap=params.get('bootstrap', 'True') 
    oob_score=params.get('oob_score', 'False')
    ccp_alpha=params.get('ccp_alpha', 0.0) 
    max_samples=params.get('max_samples', 'None')
    print(max_features)

    bid = params.get('bid')

    model = RandomForestRegressor(
        # n_jobs= None if eval(n_jobs) is None else int(n_jobs),
        # random_state=None if eval(random_state) is None else int(random_state),
        # verbose=int(verbose),
        # warm_start=eval(warm_start),
        # n_estimators=int(n_estimators),
        # criterion=criterion,
        # max_depth=None if eval(max_depth) is None else int(max_depth), 
        # min_samples_split=float(min_samples_split), 
        # min_samples_leaf=float(min_samples_leaf), 
        # min_weight_fraction_leaf=float(min_weight_fraction_leaf), 
        # max_features='sqrt',
        # max_leaf_nodes=None if eval(max_leaf_nodes) is None else float(max_leaf_nodes),
        # min_impurity_decrease=float(min_impurity_decrease),
        # bootstrap=eval(bootstrap), 
        # oob_score=eval(oob_score),
        # ccp_alpha=float(ccp_alpha),
        # max_samples=None if eval(max_samples) is None else float(max_samples),
    )

    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})


def MLDecisionTreeClassifier(request):
    params = request.POST
    splitter=params.get('splitter', 'best')
    class_weight=params.get('class_weight', None)
    random_state=params.get('random_state', None)
    criterion=params.get('criterion', 'gini')
    max_depth=params.get('max_depth', None) 
    min_samples_split=params.get('min_samples_split', 2) 
    min_samples_leaf=params.get('min_samples_leaf', 1) 
    min_weight_fraction_leaf=params.get('min_weight_fraction_leaf', 0.0) 
    max_features=params.get('max_features', 'sqrt'),
    max_leaf_nodes=params.get('max_leaf_nodes', None) 
    min_impurity_decrease=params.get('min_impurity_decrease', 0.0) 
    ccp_alpha=params.get('ccp_alpha', 0.0) 

    bid = params.get('bid')

    model = DecisionTreeClassifier(
        class_weight=None,
        random_state=None if eval(random_state[0]) is None else int(random_state[0]),
        splitter=splitter[0],
        criterion=criterion[0],
        max_depth=None if eval(max_depth[0]) is None else int(max_depth[0]), 
        min_samples_split=float(min_samples_split[0]), 
        min_samples_leaf=float(min_samples_leaf[0]), 
        min_weight_fraction_leaf=float(min_weight_fraction_leaf[0]), 
        max_features=None if eval(max_features[0]) is None else str(max_features[0]),
        max_leaf_nodes=None if eval(max_leaf_nodes[0]) is None else float(max_leaf_nodes[0]),
        min_impurity_decrease=None if eval(min_impurity_decrease[0]) is None else float(min_impurity_decrease[0]),
        ccp_alpha=None if eval(ccp_alpha[0]) is None else float(ccp_alpha[0]),
    )

    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})



def MLDecisionTreeRegressor(request):
    params = request.POST
    splitter=params.get('splitter', "best")
    random_state=params.get('random_state', None)
    criterion=params.get('criterion', 'squard_error')
    max_depth=params.get('max_depth', None) 
    min_samples_split=params.get('min_samples_split', 2) 
    min_samples_leaf=params.get('min_samples_leaf', 1) 
    min_weight_fraction_leaf=params.get('min_weight_fraction_leaf', 0.0) 
    max_features=params.get('max_features', 'sqrt'),
    max_leaf_nodes=params.get('max_leaf_nodes', None) 
    min_impurity_decrease=params.get('min_impurity_decrease', 0.0) 
    ccp_alpha=params.get('ccp_alpha', 0.0) 

    bid = params.get('bid')

    model = DecisionTreeRegressor(
        random_state=None if eval(random_state[0]) is None else int(random_state[0]),
        splitter=splitter[0],
        criterion=criterion[0],
        max_depth=None if eval(max_depth[0]) is None else int(max_depth[0]), 
        min_samples_split=float(min_samples_split[0]), 
        min_samples_leaf=float(min_samples_leaf[0]), 
        min_weight_fraction_leaf=float(min_weight_fraction_leaf[0]), 
        max_features=None if eval(max_features[0]) is None else str(max_features[0]),
        max_leaf_nodes=None if eval(max_leaf_nodes[0]) is None else float(max_leaf_nodes[0]),
        min_impurity_decrease=None if eval(min_impurity_decrease[0]) is None else float(min_impurity_decrease[0]),
        ccp_alpha=None if eval(ccp_alpha[0]) is None else float(ccp_alpha[0]),
    )

    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLVotingClassifier(request):
    params = request.POST
    bid = params.get('bid')
    clf1 = LogisticRegression(multi_class='multinomial', random_state=1)
    clf2 = RandomForestClassifier(n_estimators=50, random_state=1)
    clf3 = GaussianNB()
    model = VotingClassifier(estimators=[('lr', clf1), ('rf', clf2), ('gnb', clf3)], voting='hard')
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    # print(modelData.UID.UID)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLVotingRegressor(request):
    params = request.POST
    bid = params.get('bid')
    clf1 = LinearRegression()
    clf2 = RandomForestRegressor(n_estimators=50)
    # clf3 = GaussianNB()
    model = VotingRegressor(estimators=[('lr', clf1), ('rf', clf2)])
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLAdaBoostClassifier(request):
    params = request.POST
    bid = params.get('bid')
    model = AdaBoostClassifier()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLAdaBoostRegressor(request):
    params = request.POST
    bid = params.get('bid')
    model = AdaBoostRegressor()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLRidge(request):
    params = request.POST
    bid = params.get('bid')
    model = Ridge()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLLasso(request):
    params = request.POST
    bid = params.get('bid')
    model = Lasso()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLBernoulliNB(request):
    params = request.POST
    bid = params.get('bid')
    model = BernoulliNB()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLComplementNB(request):
    params = request.POST
    bid = params.get('bid')
    model = ComplementNB()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLGaussianNB(request):
    params = request.POST
    bid = params.get('bid')
    model = GaussianNB()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

def MLMultinomialNB(request):
    params = request.POST
    bid = params.get('bid')
    model = MultinomialNB()
    print(bid)
    modelData = BuildMLModel.objects.get(BID=bid)
    x_train, x_test, y_train, y_test = Read_csv(modelData)
    x_decoder, y_decoder = Decoders(modelData)
    model.fit(x_train, y_train)
    Save_Model(modelData, model)
    score = model.score(x_test, y_test)
    print(x_decoder)
    print(model)
    print(score)
    return render(request, 'Build/score.html', context={'bid':modelData.BID, 'uid': modelData.UID.UID, 'score':int(score*100)})

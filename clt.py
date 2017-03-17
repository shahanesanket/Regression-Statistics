import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

def CLT(populationDist,sampleSize,numberOfSamples):
    print populationDist
    np.random.seed(150)
    populationData=0
    if populationDist == 'normal':
        populationData = np.random.normal(0,1,100)
    elif populationDist == 'uniform':
        populationData = np.random.uniform(-1,1,100)
    else:
        print 'Use proper distribution {uniform/normal}'
        return
    if sampleSize<30:
        print 'Use sample size >=30'
        return
    if numberOfSamples<100:
        print 'Use number of samples >=100'
        return

    sampleArray = []

    for x in range(0,numberOfSamples,1):
        popsample = 0
        popsample = np.random.choice(populationData,sampleSize)
        sampleArray.append(popsample)

    sampleMeanArray = []
    for x in sampleArray:
        sampleMeanArray.append(np.mean(x))

    density = stats.gaussian_kde(sampleMeanArray)
    if populationDist=='uniform':
        x = np.arange(-0.5, 0.5, .01)
    elif populationDist == 'normal':
        x = np.arange(-1., 1, .01)
        #x = np.arrange(-2.,2,.01)

    plt.plot(x, density(x))
    plt.show()

    return

CLT('uniform',30,100)
    #binomialData = np.random.choice([0,1],10000,replace=True)
import numpy as np
import matplotlib.pyplot as plt

trials = range(0,10001,1)
binomialData = np.random.binomial(1,0.5,10000)
#binomialData = np.random.choice([0,1],10000,replace=True)
outcomes = [0]
for x in binomialData:
    outcomes.append(x)
print len(binomialData)
print len(outcomes)

averageArray = [0]

for x in range(1,10001,1):
    opavg = 0
    opavg = sum(outcomes[0:x])/float(x)
    averageArray.append(opavg)

print averageArray
plt.plot(trials,averageArray,linewidth=2.0)
plt.plot([0.5]*10000)
plt.axis([0,10000,0,1])
plt.xlabel('Number of coin flips')
plt.ylabel('Average')
plt.show()
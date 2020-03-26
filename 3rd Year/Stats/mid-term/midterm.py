import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#user probabilities: user 0: 0.09742483650256 user 1: 0.40468106772459 user 2: 0.23529265941813 user 3: 0.26260143635472

USER_PROBS = {
    'user0': 0.09742483650256,
    'user1': 0.40468106772459,
    'user2': 0.23529265941813,
    'user3': 0.26260143635472
}

def frequencies(values):
    frequencies = {}
    for v in values:
        if v in frequencies:
            frequencies[v] += 1
        else:
            frequencies[v] = 1
    return frequencies

def probabilities(sample, freqs):
    probs = []
    for k,v in freqs.items():
        probs.append(round(v/len(sample),5))
    return probs

if __name__ == "__main__":
    lst = []

    with open("dataset.txt") as f:
        next(f)
        for line in f:
            lst.append([int(x) for x in line.split()])

    ## Q1(a) ##
    user_times = [x[0] for x in lst]
    freqs = frequencies(user_times)
    probs = probabilities(user_times, freqs)
    x_axis = list(set(user_times))
    plt.bar(x_axis,  probs, width=1)
    plt.title("PMF of user0 Times")
    #plt.show()
    ## Q1(a) ##

    ## Q1(b) ##
    user_gt10 = list(filter(lambda x: x > 10, user_times))
    x0_1 = len(user_gt10) / len(user_times)
    print("Prob(X_0 = 1) for user0: " + str(x0_1))
    ## Q1(b) ##

    ## Q1(c) ##

    ## Q1(c) ##

    ## Q1(d) ##
    user_times = [x[1] for x in lst]
    user_gt10 = list(filter(lambda x: x > 10, user_times))
    x0_1 = len(user_gt10) / len(user_times)
    print("Prob(X_0 = 1) for user1: " + str(x0_1))

    user_times = [x[2] for x in lst]
    user_gt10 = list(filter(lambda x: x > 10, user_times))
    x0_1 = len(user_gt10) / len(user_times)
    print("Prob(X_0 = 1) for user2: " + str(x0_1))

    user_times = [x[3] for x in lst]
    user_gt10 = list(filter(lambda x: x > 10, user_times))
    x0_1 = len(user_gt10) / len(user_times)
    print("Prob(X_0 = 1) for user3: " + str(x0_1))
    
       

    ## Q1(d) ##
import matplotlib.pyplot as plt
from random import randrange, choices

USER_PROBS = {
    'user0': 0.09742483650256,
    'user1': 0.40468106772459,
    'user2': 0.23529265941813,
    'user3': 0.26260143635472
}

def prob_X(lst, i, xi_arr):
    user_times = [x[i] for x in lst]
    user_gt10 = list(filter(lambda x: x > 10, user_times))
    x = len(user_gt10) / len(user_times)
    xi_arr.append(x)
    print("Prob(X_"+str(i) + " = 1) for user"+str(i) + ": " + str(x))

# For part of q1(c)
def bootstrapping(user_times):
    x_arr = []
    for i in range(0, 1000):
        sample = choices(user_times, k=100)
        user_gt10 = list(filter(lambda x: x > 10, sample))
        x = len(user_gt10) / len(sample)
        x_arr.append(x)
    plt.hist(x_arr)
    plt.title("Bootstrapping")
    plt.show()

# For Q3
def Zn(xi_arr):
    zn = (xi_arr[0] * USER_PROBS["user0"]) + (xi_arr[1]* USER_PROBS["user1"]) + (xi_arr[2] * USER_PROBS["user2"]) + (xi_arr[3] * USER_PROBS["user3"])
    print("Zn = " + str(zn))

# For Q5
def stochastic_sim():
    user0_times = []
    user1_times = []
    user2_times = []
    user3_times = []
    user_requests = []
    for x in range(0, 100):
        user0_times.append(randrange(0, 100))
        user1_times.append(randrange(0, 100))
        user2_times.append(randrange(0, 100))
        user3_times.append(randrange(0, 100))
    user_requests.append(user0_times)
    user_requests.append(user1_times)
    user_requests.append(user2_times) 
    user_requests.append(user3_times)
    xi_arr = []
    for i in range(0, 4):
        user_gt10 = list(filter(lambda x: x > 10, user_requests[i]))
        x = len(user_gt10) / len(user_requests[i])
        xi_arr.append(x)
    print("Stochastic sim")
    Zn(xi_arr)
    
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
    xi_arr = []
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
    plt.show()
    ## Q1(a) ##

    ## Q1(b) ##
    prob_X(lst, 0, xi_arr)
    ## Q1(b) ##

    ## Q1(c) ##
    bootstrapping(user_times)
    ## Q1(c) ##

    ## Q2 ##
    prob_X(lst, 1, xi_arr)
    prob_X(lst, 2, xi_arr)
    prob_X(lst, 3, xi_arr)
    ## Q2 ##

    ## Q3 ##
    Zn(xi_arr)
    ## Q3 ##

    ## Q4 ##
    bayes = (USER_PROBS["user0"]*0.582) / ((USER_PROBS["user0"]*0.582) + (0.418*0.902575163))
    print("Q4: " + str(bayes))
    ## Q4 ##

    ## Q5 ##
    stochastic_sim()
    ## Q5 ##
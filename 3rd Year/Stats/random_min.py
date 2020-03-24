import numpy as np
import matplotlib.pyplot as plt
from random import uniform

# f(x) = x^2 - 1
f_x  = lambda x: (x ** 2) - 1

# derivative of f(x)
df_dx = lambda x: 2*x

# generate 1000 values between -1 and 5
x = np.linspace(-1, 5, 1000)

# plot f(x)
plt.plot(x, f_x(x))
plt.title("f(x)")
plt.show()

def plot_gradient(x, y, x_vis, y_vis):
    plt.subplot(1,2,2)
    plt.scatter(x_vis, y_vis, c = "b")
    plt.plot(x, f_x(x), c = "r")
    plt.title("Random Strategy")
   

    plt.subplot(1,2,1)
    plt.scatter(x_vis, y_vis, c = "b")
    plt.plot(x,f_x(x), c = "r")
    plt.xlim([2.0,3.0])
    plt.title("Zoomed in Figure")
    plt.show()

def random_strategy(x_start, precision):
    x_grad = [x_start]
    y_grad = [f_x(x_start)]
    count = 0

    while True:
        vicinity_x = uniform(x_start-1, x_start+1)

        while f_x(vicinity_x) >= f_x(x_start):
            vicinity_x = uniform(x_start-1, x_start+1)
            count += 1

        x_start = vicinity_x
        x_grad.append(x_start)
        y_grad.append(f_x(x_start))

        # Break when precision reached
        if abs(x_grad[len(x_grad)-1] - x_grad[len(x_grad)-2]) <= precision:
            break
    x_start = abs(x_start)
    print ("Local minimum occurs at: {:.2f}".format(x_start))
    print ("Number of steps taken: ",len(x_grad)-1+count)
    plot_gradient(x, f_x(x) ,x_grad, y_grad)

random_strategy(0.5, 0.0001)
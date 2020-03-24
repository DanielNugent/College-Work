import numpy as np
import matplotlib.pyplot as plt

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
    plt.title("Gradient Descent")
   

    plt.subplot(1,2,1)
    plt.scatter(x_vis, y_vis, c = "b")
    plt.plot(x,f_x(x), c = "r")
    plt.xlim([2.0,3.0])
    plt.title("Zoomed in Figure")
    plt.show()

def gradient_descent(x_start, precision, lr):
    x_grad = [x_start]
    y_grad = [f_x(x_start)]

    while True:
        # Get slope for x_start
        # Need negative descent towards minimum so use negative derivative
        x_start_deriv = -df_dx(x_start)

        # calculate x_start by adding prev to product of df_dx and learning rate
        x_start += (lr * x_start_deriv)
        print(x_start)
        x_grad.append(x_start)
        y_grad.append(f_x(x_start))
        # Break when precision reached
        if abs(x_grad[len(x_grad)-1] - x_grad[len(x_grad)-2]) <= precision:
            break
    print ("Local minimum occurs at: {:.2f}".format(x_start))
    print ("Number of steps taken: ",len(x_grad)-1)
    plot_gradient(x, f_x(x) ,x_grad, y_grad)

gradient_descent(0.5, 0.0001, 0.01)
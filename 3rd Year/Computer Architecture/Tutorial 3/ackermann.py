from timeit import default_timer as timer

procedure_calls = 0
window_depth = 0
max_depth = 0
overflows = 0
underflows = 0
filled_register = 2
register_sets = 0

def ackermann(x, y):
    global procedure_calls, window_depth, max_depth, overflows, underflows, filled_register

    procedure_calls += 1
    window_depth += 1
    overflow_handler()
    result = 0

    if x == 0:
        window_depth -= 1
        underflow_handler()
        return y + 1

    elif y == 0:
        result = ackermann(x - 1, 1)
        window_depth -= 1
        underflow_handler()
        return result

    else:
        result = ackermann(x - 1, ackermann(x, y - 1))
        window_depth -= 1
        underflow_handler()
        return result

    
def overflow_handler():
    global window_depth, max_depth, overflows, filled_register
    
    if window_depth > max_depth:
        max_depth = window_depth

    if filled_register < register_sets:
        filled_register += 1

    else:
        overflows += 1

def underflow_handler():
    global underflows, filled_register
    
    if filled_register > 2:
        filled_register -= 1
    
    else:
        underflows += 1

if __name__ == "__main__":
    time = 0.0

    register_sets = int(input("Register Sets: \n "))
    print("Doing ackermann(3, 6) with " + str(register_sets) + " Register Sets..." + "\n")

    for i in range(0, 10):
       procedure_calls = 0
       window_depth = 0
       max_depth = 0
       overflows = 0
       underflows = 0
       filled_register = 2
       begin = timer()
       ackermann(3, 6)
       end = timer()
       time += (end - begin)

    time = time / 10

    print("Procedural Calls: " + str(procedure_calls) + "\n")
    print("Max Depth: " + str(max_depth) + "\n")
    print("Overflows: " + str(overflows) + "\n")
    print("Underflows: " + str(underflows) + "\n")
    print("Average Time: " + str(time) + "\n")



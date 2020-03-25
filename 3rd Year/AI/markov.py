# Usage: python markov.py


STATES = ['fit', 'unfit', 'dead']
ACTIONS = ['exercise', 'relax']

PDICT = {
    'exercise': {
        'fit': {
            'fit': [0.891, 8],
            'unfit': [0.009, 8],
            'dead': [0.1, 0]
        },
        'unfit': {
            'fit': [0.18, 0],
            'unfit': [0.72, 0],
            'dead': [0.1, 0]
        },
        'dead': {
            'fit': [0, 0],
            'unfit': [0, 0],
            'dead': [1, 0]
        }
    },
    'relax': {
        'fit': {
            'fit': [0.693, 10],
            'unfit': [0.297, 10],
            'dead': [0.01, 0]
        },
        'unfit': {
            'fit': [0, 5],
            'unfit': [0.99, 5],
            'dead': [0.01, 0]
        },
        'dead': {
            'fit': [0, 0],
            'unfit': [0, 0],
            'dead': [1, 0]
        }
    }
}

class MarkovDecisionProcess:
    def __init__(self, G):
        self.G = G # Gamma
        self.q_outcomes = {
            'exercise': {
                'fit': {},
                'unfit': {},
                'dead': {}
            },
            'relax': {
                'fit': {},
                'unfit': {},
                'dead': {}
            }
        }

    def q0(self, state, action, n):
        if n not in self.q_outcomes[action][state]:
            q = 0
            if n == 0:
                for s in STATES:
                    q = q + PDICT[action][state][s][0] * PDICT[action][state][s][1]
                    self.q_outcomes[action][state][n] = q
            else:
                # q0(s,a) = p(s, a, fit)r(s, a, fit) + p(s, a, unfit)r(s, a, unfit)
                q = self.q0(state, action, 0) + self.G * (PDICT[action][state]['fit'][0] * 
                self.vn('fit', n-1) + PDICT[action][state]['unfit'][0] * self.vn('unfit', n-1) + PDICT[action][state]['dead'][0] * self.vn('dead', n-1))
                self.q_outcomes[action][state][n] = q
            return q
        else:
            return self.q_outcomes[action][state][n] 

    def qn(self, state, n):
        for i in range(n+1):
            p = self.q0(state, 'exercise', i)
            q = self.q0(state, 'relax', i)
            # format
            print("n=" + str(i) + " exercise: " + str(p) + " relax: " + str(q))
            
            #print("n=%d exercise %.15f relax %.15f" % (i, p, q))
            #print 'n=%d %s: %.15f; %s: %.15f' %(i, 'exercise', p, 'relax', q)

    def vn(self, state, n):
        # max(qn(s, exercise), qn(s, relax))
        qn_s_exercise = self.q0(state, 'exercise', n)
        qn_s_relax = self.q0(state, 'relax', n)
        v = max(qn_s_exercise, qn_s_relax)  
        return v

n = int(input("Enter no. of iternations, N: "))

G = float(input("Enter gamma, G (0-1): "))
while G > 1 or G < 0:
    G = float(input("Enter gamma, G (0-1): "))

start_state = input("Enter start state(fit, unfit, dead): ")
while start_state not in STATES:
    start_state = input("Enter start state(fit, unfit, dead): ")

markov = MarkovDecisionProcess(G)
markov.qn(start_state, n)
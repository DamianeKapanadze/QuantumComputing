from cmath import pi
import matplotlib.pyplot as plt
import numpy as np
from qutip import *


def applyGate(b, gate, initial_state, points):
    times = np.linspace(0, pi, 21)
    states = []

    gamma = 0.3
    c_ops = [np.sqrt(gamma) * destroy(2)]
    states = []
    i=0
    for t in times:
        result = mesolve(gate, initial_state, [0, 0.5*t], c_ops)
        states.append(result.states[-1])

        b.add_states(points, kind='point')
        b.add_states(states[i])
        b.save()
        points.append(states[i])
        b.clear()
        i+=1
    
    return b, states[-1], points

initial_state = basis(2, 0)
y_gate = sigmay()
hadamard_gate = qutip.qip.operations.hadamard_transform()
z_gate = sigmaz()
x_gate = sigmax()

b = Bloch()
b.vector_color = ['b']  # Set vector color to blue
b.point_color = ['r']
b.point_marker = ['o']
b.point_size = [25]
points = []

#points.append(initial_state)
b.view = [180,30]

b, initial_state, points= applyGate(b, x_gate, initial_state, points)

b, initial_state, points= applyGate(b, y_gate, initial_state, points)

b.add_states(points, kind='point')
b.add_states(points[-1])
b.show()
plt.show()

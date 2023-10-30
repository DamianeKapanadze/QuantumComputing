from cmath import pi
import matplotlib.pyplot as plt
from qutip import *
import numpy as np

# Define the initial state (for example, |0>)
initial_state = basis(2, 0)

# Define the X gate transformation
x_gate = sigmax()

# Define the times at which to observe the state (0 to 1 in 100 steps)
times = np.linspace(0,pi,21)

# Initialize an empty list to store states
states = []
b = Bloch()
#b.view = [-40,30]
# Evolve the initial state under the X gate at different time steps
for t in times:
    state_t = ((1j * 0.5*t * x_gate).expm()) * initial_state
    states.append(state_t)
    b.add_states(state_t)
    b.save()
# Visualize the states on the Bloch sphere
b.clear()
b.add_states(states)
b.show()
plt.show()
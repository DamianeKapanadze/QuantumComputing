from cmath import pi
import matplotlib.pyplot as plt
import numpy as np
from qutip import *

# Define the initial state (for example, |0>)
initial_state = basis(2, 0)

# Define the Hadamard gate transformation
hadamard_gate = qutip.qip.operations.hadamard_transform()

# Define the times at which to observe the state (0 to 1 in 100 steps)
times = np.linspace(0, pi, 21)

# Initialize an empty list to store states
states = []
b = Bloch()
b.view = [-100,30]

# Evolve the initial state under the Hadamard gate at different time steps
for t in times:
    state_t = (-1j * 0.5*t * hadamard_gate).expm() * initial_state
    b.add_states(state_t)
    b.save()
# Visualize the states on the Bloch sphere
b.add_states(states)  # Add states as points
b.make_sphere()  # Draw the Bloch sphere

# Show the Bloch sphere
b.show()
plt.show()

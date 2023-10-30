from cmath import pi
import matplotlib.pyplot as plt
import numpy as np
from qutip import *

# Define the initial state (for example, |0>)
initial_state = basis(2, 0)


# Define the times at which to observe the state (0 to 1 in 100 steps)
times = np.linspace(0, pi, 21)

# Initialize an empty list to store states
states = []
points = []
b = Bloch()
b.vector_color = ['b']  # Set vector color to blue
b.point_color = ['r']
b.point_marker = ['o']
point_size = [25]
x_gate = sigmax()

# Evolve the initial state under the Hadamard gate at different time steps
for t in times:
    b.add_states(points, kind='point')
    b.add_states(((1j * 0.5*t * x_gate).expm()) * initial_state)
    b.save()
    points.append(((1j * 0.5*t * x_gate).expm()) * initial_state)
    b.clear()
# Visualize the states on the Bloch sphere
b.add_states(states)  # Add states as points
b.make_sphere()  # Draw the Bloch sphere

# Show the Bloch sphere
b.show()
plt.show()

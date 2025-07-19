The Lorenz attractor is one of the most famous examples of deterministic chaos, meaning systems that are deterministic (no randomness), but still exhibit unpredictable and highly sensitive behavior due to initial conditions. More specifically, it is a set of chaotic solutions to this system of three coupled, nonlinear differential equations: 

$$
\begin{aligned}
\frac{dx}{dt} &= \sigma (y - x) \\
\frac{dy}{dt} &= x (\rho - z) - y \\
\frac{dz}{dt} &= xy - \beta z
\end{aligned}
$$

## Fun fact
The Lorenz attractor is actually the origin of the term the butterfly effect. Lorenz discovered that if he ran a weather simulation twice with just the tiniest change in the starting value, the results would diverge dramatically over time. This led to the poetic idea that: "A butterfly flapping its wings in Brazil could set off a tornado in Texas."

## Bonus fun fact
This pairs nicely with the fact that, when visualized, the Lorenz attractor actually resembles a butterfly!

## About the program
The view rotates but the viewer can move the camera around freely using the mouse. 
For this the PeasyCam library is used and can be downloaded through the processing IDE by going in the tab sketch > import library > manage libraries and then searching for PeasyCam.

Here's a preview:
<video src="https://github.com/user-attachments/assets/017f1289-eb77-4095-8872-8f1a96bc81cb"></video>

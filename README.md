# Muse_EEG_mind_levitate
A simple processing program / game where you can levitate the ball on screen by concentrating.
This is a small prototype as part of my research for my thesis on generative visual art with EEG.

This program uses the oscp5 library to get the data from the smartphone app (both ios & android) mind monitor, which I highly recommend for a simple
way to get the OSC data from the headset into your computer.

The Muse headset I've used is the 2016 model.

The relative beta is calculated as follows:
beta_relative = (10^beta_absolute / (10^alpha_absolute + 10^beta_absolute + 10^delta_absolute + 10^gamma_absolute + 10^theta_absolute))
in the code 10^x is expressed as pow(x, 10)

Try mapping the background color and other parameters to relative beta. With more visual feedback, it'll be more fun!
Try playing with the minimum and maximum mapping targets for relative beta

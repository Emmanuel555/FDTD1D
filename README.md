# FDTD1D

This is an implementation of 1D FDTD algorithm solveing the transmission line problem in Chapter 2 of "Computational Electromagnetics for RF and Microwave Engineering" by David B. Davidson

#System requirements:

I'm using Archlinux, so assuming you have your sleek ArchLinux up and running with yaourt installed
##Install Octave or Matlab

```
yaourt -S octave
```
for MATLAB, you know the legal way to get a copy right?

#Running demo code
In your Octave/Matlab prompt
```
>> FDTD1D_demo
```

#Main script

function [V_nk, I_nk] = FDTD1D(h, C, L, Rs, Rl, v0, freq, Nz, SamplesPerPeriod, SettlingPeriods)    

**Parameters**

* h: Electrical length of the transmission line
* C: Effective propogating capacitance
* L: Effective propogating inductance
* Rs: Source resistive load impedance
* Rl: Load resistive load impedance
* v0: Magnitude of excitation from source
* freq: Frequency of excitation from source
* Nz: Spatial sampling points along z direction
* SamplesPerPeriod
* SettlingPeriods

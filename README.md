# 3D-BEM-WEC
## 3D Boundary Element Method (BEM) Solver for Wave Energy Converters
<div align="justify">
This repository hosts a 3D BEM solver for computing frequency-domain hydrodynamic coefficients (added mass, damping, excitation forces) of arbitrary 3D bodies interacting with waves. The solver is implemented in MATLAB and Simulink, with modules for both hydrodynamics and dynamics simulations.  
  
by: Taha Rezaee, PhD: University of Tehran (rezaee.taha@ut.ac.ir)
</div>

## Features
### Hydrodynamics Solver: 
MATLAB scripts to solve radiation/diffraction problems using the boundary integral equation method.
### Dynamics Modules:
Simulink model for transient behavior simulation.
Frequency-domain script for steady-state response analysis.

## Repository Structure
├── /Simulink-Model/      # (Under development) The theory and model files for the transient dynamics  
├── /Validation-3D-Radiation-Cylinder/      # Test cases for radiation problem  
├── /Validation-3D-Diffraction-Barge/    # Test cases for diffraction problem  
├── /Validation-Experimental-Wave-Tank/ # Experiments on a laboratry wave tank  
└── (Under development)/  # Additional documentation/examples to be added  

## Current Status
⚠️ Work in Progress: This repository is under active development. Future updates will include:  
1- the Simulink model  
2- a tutorial on how to run the code for arbitrary 3D geometry.  

## Citation
If this solver aids your research, please cite the associated manuscript once published. A DOI will be provided here upon acceptance.

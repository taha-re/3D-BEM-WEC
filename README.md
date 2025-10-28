# 🔬 3D-BEM-WEC: 3D Boundary Element Method Solver for Wave Energy Converters

> **A comprehensive 3D BEM solver for computing frequency-domain hydrodynamic coefficients of arbitrary 3D bodies interacting with waves**

---

## 👨‍🔬 Author Information

**Taha Reza**  
📧 **Email:** [rezaee.taha@gmail.com](mailto:rezaee.taha@gmail.com)   |  🔬 **ORCID:** [![ORCID](https://img.shields.io/badge/ORCID-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0009-0008-6807-0765)

---
<div align="center">

![Wave Energy](https://img.shields.io/badge/Wave-Energy-blue?style=for-the-badge&logo=wave&logoColor=white)
![MATLAB](https://img.shields.io/badge/MATLAB-Expert-orange?style=for-the-badge&logo=matlab)
![Hydrodynamics](https://img.shields.io/badge/Hydrodynamics-Solver-009688?style=for-the-badge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</div>

## 📋 Overview

<div align="justify">

This repository hosts a sophisticated 3D Boundary Element Method (BEM) solver designed for computing frequency-domain hydrodynamic coefficients—including **added mass**, **radiation damping**, and **wave excitation forces**—of arbitrary three-dimensional bodies interacting with ocean waves. The solver is implemented in **MATLAB** and **Simulink**, featuring comprehensive modules for both hydrodynamics analysis and dynamics simulations.


</div>

## ✨ Key Features

### 🌊 Hydrodynamics Solver
- **Boundary Integral Equation Method** implementation for radiation/diffraction problems
- **Frequency-domain analysis** of wave-structure interaction
- Support for **arbitrary 3D geometries**
- Computation of **hydrodynamic coefficients** (added mass, damping, excitation forces)

### ⚡ Dynamics Modules
- **Simulink model** for transient behavior simulation
- **Frequency-domain script** for steady-state response analysis
- Comprehensive **validation cases** for various geometries

## 🗂️ Repository Structure

```
3D-BEM-WEC/
│
├── 📁 Simulink-Model/                 # (Under development) Transient dynamics theory and model files
├── 📁 Validation-3D-Radiation-Cylinder/    # Test cases for radiation problem validation
├── 📁 Validation-3D-Diffraction-Barge/     # Test cases for diffraction problem validation  
├── 📁 Validation-Experimental-Wave-Tank/   # Laboratory wave tank experiments
└── 📁 Documentation/                  # (Under development) Additional documentation & examples
```

## 🚧 Current Status

<div align="center">

⚠️ **Work in Progress** • This repository is under active development

</div>

### Planned Updates:
1. **Complete Simulink model** for transient dynamics simulation
2. **Comprehensive tutorial** on running the code for arbitrary 3D geometries
3. **Extended documentation** and usage examples
4. **Additional validation cases** and benchmark problems

## 📊 Validation & Verification

The solver includes extensive validation through:
- **3D Radiation problems** (circular cylinders)
- **3D Diffraction problems** (barge geometries)  
- **Experimental comparisons** with wave tank data
- **Benchmark cases** against established commercial codes

## 📚 Citation

If this solver contributes to your research, please cite the associated manuscript once published. A DOI will be provided here upon acceptance.

```bibtex
% Citation details to be updated upon publication
```

---

<div align="center">

**🔬 Research • 💡 Innovation • 🌊 Renewable Energy**

*Advancing wave energy conversion through computational hydrodynamics*

</div>

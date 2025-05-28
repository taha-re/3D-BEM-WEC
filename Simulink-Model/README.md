# Floating Body Motion in the Time Domain  
<div align="justify">
The hydrodynamic reaction forces and moments resulting from the time-varying motions of floating bodies can be described using Cummins' traditional formulation [1]. As shown by Ogilvie [2], complex potential problems can be solved using frequency-dependent potential coefficients. Below, the principles of this approach are examined for a single-degree-of-freedom problem.
</div>

## The Cummins Equation  
<div align="justify">
The floating body is assumed to be a linear system with a translational velocity as the input and the surrounding water’s reaction force as the output. It is also assumed that the body is at rest at time t=t0. Over a short time interval Δt, the body undergoes a sudden displacement Δx at a constant velocity ΔV, such that:
</div>  

![1](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/1.PNG) 
<div align="justify">
During this sudden displacement, the water particles begin to move. Since the flow is assumed to be potential, a velocity potential ΔΦ, proportional to the velocity V, can be defined:  
</div>  

![2](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/2.PNG)  

where Ψ is a normalized velocity potential.
<div align="justify">
The water particles continue to move even after this sudden displacement. Since the system is assumed to be linear, the fluid motion—described by the velocity potential Φ—will be proportional to the sudden displacement Δx. Therefore:
</div>  

![3](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/3.PNG)

where χ is a normalized velocity potential.
<div align="justify">
A general conclusion can be drawn that the sudden displacement Δx during the time interval (t0,t0+Δt) affects the fluid motion not only within this interval but also in subsequent time intervals. Similarly, motions during (t0,t0+Δt) are influenced by motions prior to this interval—as if the system possesses a kind of memory.  
</div> 
<div align="justify">
When the body undergoes an arbitrary time-dependent motion, this motion can be treated as a sequence of small, sudden displacements. The total velocity potential Φ(t) during the interval (tm,tm+Δt) can then be expressed as follows:
</div> 

![4](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/4.PNG)

<div align="justify">
where m is the number of time steps, Vm is the velocity component during the time interval (tm,tm+Δt), Vk is the velocity component during the time interval (tm−k,tm−k+Δt), Ψ is the normalized velocity potential resulting from a displacement during (tm,tm+Δt), and χ is the normalized velocity potential resulting from a displacement during (tm−k,tm−k+Δt). Now, by taking the limit as Δt approaches zero, we obtain:
</div> 

![5](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/5.PNG)

<div align="justify">
where x(τ) is the velocity component of the body at time τ. The pressure in the fluid is obtained from the linearized Bernoulli equation:
</div> 

![6](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/6.PNG)

<div align="justify">
Integrating this pressure over the wetted surface S of the floating body yields an expression for the hydrodynamic reaction force F. Considering n as the direction cosine, F is obtained as follows:
</div> 

![7](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/7.PNG)

Now by defining:

![8](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/8.PNG)

The hydrodynamic force can then be expressed as:

![9](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/9.PNG)


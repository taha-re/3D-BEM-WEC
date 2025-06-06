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

![11](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/11.PNG)

<div align="justify">
By adding a linear restoring spring term G⋅x and an external linear load X(t), Newton's second law yields the linear time-domain equation of motion:
</div> 

![9](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/9.PNG)

<div align="justify">
where M is the mass of the body, A is the hydrodynamic added mass coefficient, K(t) is the retardation function, G is the geometric stiffness coefficient, and X(t) is the external load. Now, by changing variables and adjusting the integration limits, we rewrite this equation as:
</div> 

![10](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/10.PNG)

This equation is called the Cummins equation [1].

## Determination of the Coefficients in the Cummins Equation
<div align="justify">
The linear hydrostatic restoring stiffness coefficient, G, can be easily calculated from the underwater geometry of the body. To determine the coefficients A and K(t), the velocity potentials Ψ and χ must be computed. A direct approach to this calculation would be highly complex. A simpler method for determining these coefficients was proposed by Ogilvie [2]. He utilized hydrodynamic added mass and damping data, computed by frequency-domain potential flow software, to express the required coefficients A and K(t) in terms of the calculated hydrodynamic mass and damping data. The Ogilvie procedure is described below.
Assume the body undergoes harmonic oscillation with unit amplitude:
</div> 

![12](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/12.PNG)

Substituting this into the Cummins equation yields:

![13](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/13.PNG)

Rewriting this equation results in:

![14](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/14.PNG)

Now, recalling the frequency-domain representation of this motion:

![15](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/15.PNG)

<div align="justify">
where a(ω) is the frequency-dependent hydrodynamic added mass coefficient and b(ω) is the frequency-dependent hydrodynamic damping coefficient.  
By comparing the frequency-domain and time-domain (cummins) equations, we conclude that:
</div> 

![16](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/16.PNG)

To obtain the retardation function, the inverse Fourier transform is applied:

![17](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/17.PNG)

For the mass term, we have:

![18](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/18.PNG)

This relationship holds for any value of ω, including ω=∞. Therefore:

![19](https://github.com/taha-re/3D-BEM-WEC/blob/main/Simulink-Model/figures/19.PNG)

<div align="justify">
Based on this relation, A is typically referred to as the infinite-frequency added mass and denoted by A∞ .
</div> 

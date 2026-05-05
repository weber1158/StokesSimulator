# Documentation for `StokesSimulator`

## How to Use
Once everything is properly installed (see [**`README`**](https://github.com/weber1158/StokesSimulator)), you can open the Stokes' Law simulation GUI by executing the following in the MATLAB Command Window:

```matlab
>> StokesSimulator
```

After a few seconds, the app should open in a separate window. The `v2.0` interface looks like this:

<img width="667" height="616" alt="image" src="https://github.com/user-attachments/assets/26eb3a8e-ed1b-4be8-9154-3da15870c639" />


### The Interface
The `StokesSimulator` app has several interactive components.

#### Components
1. Upon startup, the **UIAxes component** will plot the particles' settling velocities using the default model input parameters. Just like a normal MATLAB figure, you can mouse over the chart and a set of interactive tools will appear above the plot in the top-right corner. You can use these tools to zoom, pan, copy, and brush the data. You can also mouse over the individual data points to see the corresponding x- and y-coordinates. 

2. The **Particle Diameter slider** just below the figure allows you to adjust the x-limits of the chart. The minimum and maximum can be set manually by clicking inside of the display boxes on either side of the slider.

3. You can rescale the x- and/or y-axis of the figure by toggling the relevant **Logscale checkbox**.

4. Toggling the **Display Equation checkbox** will print the approximate equation of the line in the upper left corner of the figure.

5. You can move the **Elevation slider** to adjust the height above ground level. Earth's atmosphere becomes thinner at higher altitudes, and so by increasing the starting elevation the settling velocities of the particles will also increase (because less air = less air resistance).

6. By default, the **Particle Mineralogy dropdown** sets the density of the particles to 2700 kg/m^3, or the average density of the continental crust. You can select a specific mineral species by clicking the dropdown and choosing from a list of 13 minerals.

7. Stokes' Law assumes that particles are spherical, and so by default the **Aspect Ratio slider** is set to 1. However, you can increase the elongation of the particles by moving the slider. This will apply a correction factor to the values modeled using Stokes' Law. Increasing the aspect ratio of the particles increases their drag coefficients; in consequence, their settling velocities decrease.

8. Clicking the **Water tab** at the top of the app will allow you to simulate dust settling velocities in a water medium rather than in air. When working in the **Water tab** the interface will turn blue, so there should be no mistaking which tab you are in.

9. In the **Water tab** there is no option for adjusting the elevation or aspect ratio of the particles. However, there is a **Temperature slider** that allows you to adjust the density of water and its dynamic viscosity.

# How does the app work?
### What's going on in the backend?
#### Stokes' Law
The physical equations behind the model are relatively simple. Stokes' Law is defined as:

```tex
V_p = (2/9) * (r^2 * (rho_p - rho_f) * 9.81) / mu_f
```

where `V_p` is the settling velocity of a particle, `r` is the radius the particle, `rho_p` is the density of the particle, `rho_f` is the density of the fluid medium, and `mu_f` is the dynamic viscosity of the fluid.

#### Particle Size
By default, the `StokesSimulator` app evaluates and illustrates the settling velocities of particles with diameters ranging from 0.63 microns to 16.00 microns. 

---
### Air Calculations
#### Air Density and Dynamic Viscosity

In order to calculate `rho_f` and `mu_f` for the fluid, the `StokesSimulator` app uses air density and air viscosity data from [Engineering Toolbox](https://www.engineeringtoolbox.com/standard-atmosphere-d_604.html). Because Engineering Toolbox only provides data in 1000-meter intervals, we have to use interpolation for the remaining air density and air viscosity values. In the model backend, this is accomplished by fitting simple, second-order polynomials to the fluid data:

<img width="800" height="360" alt="air_density_viscosity" src="https://github.com/user-attachments/assets/d7efaa7e-b365-413c-a7da-524f3ad2ec3b" />

#### Particle Density

The value for `rho_p` (the density of the particles) is a determined by mineralogy. The mineral densities used in the `StokesSimulator` app are from [Gonçalves Ageitos et al. (2023)](https://doi.org/10.5194/acp-23-8623-2023):

| **Mineral** | **Density (kg/m^3)** |
| --- | :---: |
| Quartz | 2670 |
| Calcite | 2710 |
| Feldspars | 2680 |
| Gypsum | 2308 |
| Illite | 2570 |
| Kaolinite | 2630 |
| Smectite | 2570 |
| Vermiculite | 2300 |
| Chlorite | 2420 |
| Mica | 2810 |
| Iron oxides | 4770 |
| Hematite | 5210 |
| Goethite | 4180 |

#### Aspect Ratio Correction
Stokes' Law assumes that the particles are perfectly spherical. In reality, this is rarely true. According to [Ginoux (2003)](https://doi.org/10.1029/2002JD002516), increasing the aspect ratio of a particle decreases its settling velocity. A correction factor (`du`) for calculating the relative reduction in settling velocity (`Vp`) was derived as:

```tex
du ~ a0 * exp(-(z^2)/2) + a3 + a4*x + a5*x^2
```

where `z = (x - a1)/a2` and `x = log10(2r)` (recall that `r` is the radius of the particle). The formula is constrained by six parameters, `a0` through `a5`. Table 2 in Ginoux (2003) defines the values of these parameters for aspect ratios ranging from 2 to 10. The `StokesSimulator` app takes this data and fits polynomial models to each parameter. The resulting model equations are used to estimate `du` for any aspect ratio between 1 (exclusive) and 10 (inclusive). The values for the fitting parameters, and the fifth-order polynomial model fits, are shown below:

<img width="600" height="600" alt="fitting_parameters" src="https://github.com/user-attachments/assets/302cffc3-ee6d-42f5-b641-127444c04344" />

---
### Water Calculations
<img width="665" height="617" alt="image" src="https://github.com/user-attachments/assets/8031f81b-50a8-41ce-8f72-4608f3988add" />

#### Temperature Correction
In the **Water tab**, you can simulate the Stokes' Law settling velocities of particles in water. Adjusting the **Temperature slider** will change the density and dynamic viscosity of the fluid (i.e., the `rho_f` and `mu_f` terms). This calculation is done by fitting polynomial models to data from [Engineers Edge](https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm). Water density varies as a function of temperature according to a third-order polynomial while the dynamic viscosity of water follows a fourth-order polynomial:

<img width="800" height="360" alt="water_density_viscosity" src="https://github.com/user-attachments/assets/8bf4fe5c-7e22-43d5-95c2-96d4189ed161" />

---
### Calculating the Equation of the Line
One of the most useful features of the `v2.0` of the `StokesSimulator` app is the **Display Equation checkbox**. Toggling this box will display the approximate equation of the Stokes' Law line in the upper left corner of the figure. For example:

<img width="666" height="618" alt="image" src="https://github.com/user-attachments/assets/a98a76b3-2ca1-4549-952b-3cc9f56e64bd" />

As you can see, when the data are plotted on a log scale in the x- and y-dimension, the data fall approximately along a straight line. The `StokesSimulator` app evaluates the equation of this line using linear regression, and reports the equation of the line to the user in linear space:

*Equation in logspace:*
```
log10(Velocity) = m*log10(diameter) + b
```

*Equation in linear space:*
```
Velocity = diameter^m * 10^b
```
When the aspect ratio is greater than 1, the data become less linear. As such, the equation displayed by the app is only an approximation.  
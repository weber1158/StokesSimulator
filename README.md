# **Stokes Simulator**

[![View my project on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/183801-stokessimulator) [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/fileexchange/v1?id=183801)

*Visualize the settling speeds of mineral particles in the atmosphere or in water.*

<img width="799" height="700" alt="image" src="https://github.com/user-attachments/assets/37d5361f-c300-470c-959d-11f17ae78c14" />

## ℹ **About**
`StokesSimulator` is a graphical user interface designed in MATLAB.

Within the `StokesSimulator` app, particle settling velocities are determined using Stokes' Law, and can be dynamically adjusted by updating the elevation of the particles relative to ground level, or by updating the mineral composition of the particles, or by applying an aspect ratio correction. 

Stokes' Law for the settling velocity of a particle (`Vp`) takes the form:

```Vp = (2/9) * (r^2 * (rho_p - rho_f) * 9.81) / mu_f```

where `r` is the radius of a particle, `rho_p` is the density of the particle, `rho_f` is the density of the fluid (in this case air), and `mu_f` is the dynamic viscosity of the fluid. The terms `rho_f` and `mu_f` depend on elevation.

`rho_f` and `mu_f` are calculated using data from [Engineering Toolbox](https://www.engineeringtoolbox.com/standard-atmosphere-d_604.html), or, if you are working in the water simulator tab, the fluid parameters are calculated using data from [Engineers Edge](https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm).

Mineralogical composition governs the `rho_p` term. Mineral densities were acquired from Gonçalves Ageitos et al. ([2023, Atmos. Chem. Phys.](https://doi.org/10.5194/acp-23-8623-2023)). 

The aspect ratio correction is based on the work of Ginoux ([2003, JGR Atmos.](https://doi.org/10.1029/2002JD002516)).

## 🛠 **Installation**
Download this repository on your PC and call the `pathtool` function in MATLAB to open the Path Tool app. Use the Path Tool app to add the contents of this repository to the default search path. This will complete your installation and you can then call

```matlab
>> StokesSimulator
```

from the Command Window to open the `StokesSimulator` app.

## 📖 **Documentation**
Documentation for this repository will be housed on the [**Wiki page**](https://github.com/weber1158/StokesSimulator/wiki/Documentation).

## 🤝 **Contributing**
Contributions are always welcome! Simply:
1. Fork this repository
2. Make your desired changes/additions
3. Submit a pull request

## 👷‍♀️ **Requests and Support**
If you would like to report an error  or file a feature request, please open a new issue on the [**Issues page**](https://github.com/weber1158/StokesSimulator/issues).

For general questions or disscussion, you can open a new discussion on the [**Disucussions page**](https://github.com/weber1158/StokesSimulator/discussions).

---

### How to cite
```tex
@misc{StokesSimulator,
    author = {Weber, Austin M.},
    title = {Stokes Simulator},
    note = {version 2.x [Software]. GitHub. https://github.com/weber1158/StokesSimulator}
}
```

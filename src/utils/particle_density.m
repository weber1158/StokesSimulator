function rho_p = particle_density(mineralogy)
%Density of particle
%Returns density (kg/m^3) of a particle based on mineralogy
  switch mineralogy
    case 'Average Crustal'
      rho_p = 2700;
    case 'Calcite'
      rho_p = 2710;
    case 'Chlorite'
      rho_p = 2420;
    case 'Feldspar'
      rho_p = 2680;
    case 'Fe-oxides'
      rho_p = 4770;
    case 'Goethite'
      rho_p = 4180;
    case 'Gypsum'
      rho_p = 2308;
    case 'Hematite'
      rho_p = 5210;
    case 'Illite'
      rho_p = 2570;
    case 'Kaolinite'
      rho_p = 2630;
    case 'Mica'
      rho_p = 2810;
    case 'Smectite'
      rho_p = 2570;
    case 'Quartz'
      rho_p = 2670;
    case 'Vermiculite'
      rho_p = 2300;
  end
end
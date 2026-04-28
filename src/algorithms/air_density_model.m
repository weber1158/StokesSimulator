function val = air_density_model(altitude)
%Modeled air density
%Calculate the density of air (kg/m3) at a specified altitude
  elevations = 0 : 1000 : 8000;
  air_densities = [1.2250;
                   1.1120; 
                   1.0070; 
                   0.9093;
                   0.8194; 
                   0.7364; 
                   0.6601;
                   0.5900;
                   0.5258];
  polyfit_coefficients = polyfit(elevations, air_densities, 2);
  val = polyval(polyfit_coefficients, altitude);
end
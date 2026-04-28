function val = air_viscosity_model(altitude)
%Modeled air viscosity
%Calculate the dynamic viscosity of air (kg/m/s) at a specified altitude
  elevations = 0 : 1000 : 8000;
  air_viscosities = [1.7890;
                     1.7580; 
                     1.7260; 
                     1.6940;
                     1.6610; 
                     1.6280; 
                     1.5950;
                     1.5610;
                     1.5270] .* 10^(-5);
  polyfit_coefficients = polyfit(elevations, air_viscosities, 2);
  val = polyval(polyfit_coefficients, altitude);
end
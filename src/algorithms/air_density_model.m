function val = air_density_model(altitude)
%Modeled air density
%Calculate the density of air (kg/m3) at a specified altitude
persistent elevations
persistent air_densities
persistent polyfit_coefficients

if isempty(elevations)
  elevations = 0 : 1000 : 8000;
end

if isempty(air_densities)
  air_densities = [1.2250;
                   1.1120; 
                   1.0070; 
                   0.9093;
                   0.8194; 
                   0.7364; 
                   0.6601;
                   0.5900;
                   0.5258];
end
  
if isempty(polyfit_coefficients)
  polyfit_coefficients = polyfit(elevations, air_densities, 2);
end

val = polyval(polyfit_coefficients, altitude);
end

% Data from Engineering Toolbox
% https://www.engineeringtoolbox.com/standard-atmosphere-d_604.html
% Last accessed 28 April 2026
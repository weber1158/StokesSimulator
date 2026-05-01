function val = water_density_model(temperature)
%Modeled water density
%Calculate the density of water (kg/m3) at a specified temperature
  temps = [  0.0; 
             4.0; 
             4.4; 
            10.0; 
            15.6; 
            21.0; 
            26.7; 
            32.2; 
            37.8; 
            48.9; 
            60.0; 
            71.1; 
            82.2; 
            93.3; 
           100.0]; % Degrees C
  water_densities = [0.99987;
                     1.00000; 
                     0.99999; 
                     0.99975;
                     0.99907; 
                     0.99802; 
                     0.99669;
                     0.99510;
                     0.99318;
                     0.98870;
                     0.98338;
                     0.97729;
                     0.97056;
                     0.96333;
                     0.95865].*1000; % g/cm^3 to kg/m^3
  polyfit_coefficients = polyfit(temps, water_densities, 3); % 3rd-order fit
  val = polyval(polyfit_coefficients, temperature);
end

% Data from Engineers Edge:
% https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm
% Last accessed: 28 April 2026
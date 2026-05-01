function val = water_viscosity_model(temperature)
%Modeled water dynamic viscosity
%Calculate the dynamic viscosity of water (N s/m^2) at a specified temperature
  temps = [0 5 10:10:100]'; % Degrees C
  water_viscosities = [1.787;
                       1.519;
                       1.307;
                       1.002;
                       0.798;
                       0.653;
                       0.547;
                       0.467;
                       0.404;
                       0.355;
                       0.315;
                       0.282].*10^(-3); % N s/m^2
  polyfit_coefficients = polyfit(temps, water_viscosities, 4); % 4th-order fit
  val = polyval(polyfit_coefficients, temperature);
end

% Data from Engineers Edge:
% https://www.engineersedge.com/physics/water__density_viscosity_specific_weight_13146.htm
% Last accessed: 28 April 2026
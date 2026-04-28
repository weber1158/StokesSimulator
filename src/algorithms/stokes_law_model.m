function V_p = stokes_law_model(density_p, altitude)
%Stokes settling velocity
%Calculate settling velocity (m/hr) using Stoke's Law approximations
  r_microns = [0.63; 0.80; 1.00; 1.26; 1.59; 2.02; 2.52; 3.14; 4.00;
               5.04; 6.35; 8.00; 10.08; 12.70; 16.00]./2;
  r_meters = r_microns ./ 1000000;
  density_f = air_density_model(altitude);
  mu_f = air_viscosity_model(altitude);
  
  V_p = (2/9) .* (r_meters.^2 .* (density_p - density_f) .* 9.81) ./ mu_f;
  V_p = V_p .* 3600; % Covert from m/s to m/hr
end
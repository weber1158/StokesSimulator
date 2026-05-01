function V_p = stokes_law_model(D, density_p, altitude)
%Stokes settling velocity
%Calculate settling velocity (cm/hr) using Stoke's Law approximations
  if nargin < 2
    density_p = 2700; % kg/m^3
    altitude = 0; % meters
  end
  if nargin < 3
    altitude = 0; % meters
  end
  density_f = air_density_model(altitude);
  mu_f = air_viscosity_model(altitude);
  r_microns = D./2;
  r_meters = r_microns ./ 1000000;
  V_p = (2/9) .* (r_meters.^2 .* (density_p - density_f) .* 9.81) ./ mu_f;
  V_p = V_p .* 3600; % Convert from m/s to m/hr
  V_p = V_p .* 100;  % Convert from m/hr to cm/hr
end
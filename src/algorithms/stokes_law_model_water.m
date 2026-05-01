function V_p = stokes_law_model_water(D, density_p, density_f, mu_f)
%Stokes settling velocity in water
%Calculate settling velocity (cm/hr) using Stoke's Law approximations
%Note that this function assumes the dynamic viscosity of 1.002 mPa/s for
%water at 20 degrees C.
  if nargin < 2
    density_p = 2700; % kg/m^3
    density_f = 1000; % N s/m^2
    mu_f = 0.0010016; % N s / m^2 [at 20 degrees C]
  end
  if nargin < 3
    density_f = 1000; % N s/m^2
    mu_f = 0.0010016; % N s / m^2 [at 20 degrees C]
  end
  if nargin < 4
    mu_f = 0.0010016; % N s / m^2 [at 20 degrees C]
  end
  r_microns = D ./ 2;
  r_meters = r_microns ./ 1000000;
  V_p = (2/9) .* (r_meters.^2 .* (density_p - density_f) .* 9.81) ./ mu_f;
  V_p = V_p .* 3600; % Convert from m/s to m/hr
  V_p = V_p .* 100;  % Convert from m/hr to cm/hr
end
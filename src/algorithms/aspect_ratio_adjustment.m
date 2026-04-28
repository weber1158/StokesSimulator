function delta_u = aspect_ratio_adjustment(radius_p, AR)
%Relative reduction of settling velocity
%Nonlinear adjustment as a function of particle size and aspect ratio
% See Equation 12 in Ginoux (2001) and Table 2.

  % Fitting parameter z, which is a function of x, a1, and a2
  function z = calculate_z(x,a1,a2)
    z = (x-a1)/a2;
  end

  % Equation for calculating the rel. reduction in settling velo (%)
  adjustment = @(x,a0,z,a3,a4,a5) a0*exp(-(z^2)/2)+a3+(a4*x)+(a5*(x^2));

  if AR == 1
    % No elongation, no adjustment needed
    delta_u = 1;

  else
    % Log10(Diameter_p)
    x = log10(radius_p*2);

    % Fitting parameters
    a0 = calculate_a0(AR);
    a1 = calculate_a1(AR);
    a2 = calculate_a2(AR);
    a3 = calculate_a3(AR);
    a4 = calculate_a4(AR);
    a5 = calculate_a5(AR);
  
    % Calculate the % change in settling speed
    delta_u = adjustment(x, a0, calculate_z(x, a1, a2), a3, a4, a5);
  
    % Convert from percentage to fraction
    delta_u = delta_u / 100; % Percent change as a fraction
    delta_u = 1 - delta_u; % Fraction as a reduction factor (so that you can
                           % multiply delta_u by the Stokes settling speed to
                           % obtain the aspect-ratio adjusted speed).

  end % End of if-statement

end % End of function
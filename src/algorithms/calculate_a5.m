function a5 = calculate_a5(aspect_ratio)
%Fitting parameter a0, as a function of aspect ratio
%The a0 fitting parameter for Eq.12 in Ginoux (2003)

  % Fitting parameters: a0, a1, a2, a3, a4, and a5 for ARs 2:10
  ai = [-36.2340	2.1860	0.1800	 0.5980	  4.8080   8.0110
        -55.6570	2.2650	0.2210	11.2340	  8.5120  10.6020
        -66.5720	2.3610	0.2700	20.7190	 10.2180  10.7660
        -77.1800	2.4720	0.3240	28.2320	 10.9780  10.4260
        -88.0680	2.5860	0.3760 	34.1930	 11.2920   9.9940
        -99.4920	2.7010	0.4260 	39.0130	 11.3840   9.5770
        -110.926	2.8130	0.4720 	42.9920	 11.3620   9.2000
        -121.087	2.9150	0.5130 	46.3380	 11.2800   8.8560
        -130.914	3.0120	0.5520 	49.1960	 11.1670   8.5510];

  % Aspect ratio range
  ar_range = 2:10;
  % Fit 5th-degree polynomial to the data
  %   If you don't trust the fitting choice, run the `fitting_parameters.m`
  %   script to see the output. The app that we are building only considers
  %   aspect ratios between 1 and 10, and so the 5th degree polynomial fit
  %   works very well with this input range.
  C = polyfit(ar_range, ai(:,6), 5);

  % Calculate a0
  a5 = polyval(C, aspect_ratio);
end
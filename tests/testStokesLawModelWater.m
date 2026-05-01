classdef testStokesLawModelWater < matlab.unittest.TestCase

    methods (Test)

        function testKnownReferenceValue(testCase)

            D = 0.80;           % microns
            density_p = 2430;   % kg/m^3
            density_f = 998;    % kg/m^3
            mu_f = 0.001035;    % Pa*s

            actual = stokes_law_model_water( ...
                D, density_p, density_f, mu_f); % cm/hr
            actual = actual / 100 / 3600; % m/s

            expected = 4.82591e-7;  % m/s
            
            % Expected value was calculated using the Stokes' Law Calculator
            % at https://www.omnicalculator.com/physics/stokes-law:
            % 
            % Acceleration of gravity: 9.81 m/s^2
            % Medium viscosity: 0.001035 Pa s
            % Medium density: 998 kg/m^3
            % Particle density: 2430 kg/m^3
            % Particle diameter: 0.0000008 m

            testCase.verifyEqual( ...
                actual, expected, ...
                "AbsTol", 1e-4);

        end

        function testDiameterScaling(testCase)

            density_p = 2650;
            density_f = 1000;
            mu_f = 0.001;

            V10 = stokes_law_model_water( ...
                10, density_p, density_f, mu_f);

            V20 = stokes_law_model_water( ...
                20, density_p, density_f, mu_f);

            % Stokes settling scales with D^2
            testCase.verifyEqual( ...
                V20 / V10, ...
                4, ...
                "AbsTol", 1e-10);

        end

        function testIncreasingDiameterIncreasesVelocity(testCase)

            density_p = 2650;
            density_f = 1000;
            mu_f = 0.001;

            D = [5 10 20 40];

            V = stokes_law_model_water( ...
                D, density_p, density_f, mu_f);

            testCase.verifyGreaterThan(V(2), V(1));
            testCase.verifyGreaterThan(V(3), V(2));
            testCase.verifyGreaterThan(V(4), V(3));

        end

    end

end
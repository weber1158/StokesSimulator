classdef testStokesLawModel < matlab.unittest.TestCase

    methods (Test)

        function testKnownReferenceValue(testCase)

            elevation = 5680;      % m above ground level
            D = 0.80;              % microns
            density_p = 2430;      % kg/m^3

            actual = stokes_law_model( ...
                D, density_p, elevation); % cm/hr
            actual = actual / 100 / 3600; % m/s

            expected = 0.0000526876;  % m/s
            
            % Expected value was calculated using the Stokes' Law Calculator
            % at https://www.omnicalculator.com/physics/stokes-law:
            % 
            % Acceleration of gravity: 9.81 m/s^2
            % Medium viscosity: 0.0000160824 Pa s
            % Medium density: 0.688948 kg/m^3
            % Particle density: 2430 kg/m^3
            % Particle diameter: 0.0000008 m

            testCase.verifyEqual( ...
                actual, expected, ...
                "AbsTol", 1e-4);

        end

        function testDiameterScaling(testCase)

            density_p = 2650;
            elevation = 4000;

            V2_5 = stokes_law_model( ...
                2.5, density_p, elevation);

            V5_0 = stokes_law_model( ...
                5.0, density_p, elevation);

            % Stokes settling scales with D^2
            testCase.verifyEqual( ...
                V5_0 / V2_5, ...
                4, ...
                "AbsTol", 1e-10);

        end

        function testIncreasingDiameterIncreasesVelocity(testCase)

            density_p = 2650;
            elevation = 10;

            D = [0.5 1.0 2.5 16];

            V = stokes_law_model( ...
                D, density_p, elevation);

            testCase.verifyGreaterThan(V(2), V(1));
            testCase.verifyGreaterThan(V(3), V(2));
            testCase.verifyGreaterThan(V(4), V(3));

        end

    end

end
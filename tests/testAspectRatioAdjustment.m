classdef testAspectRatioAdjustment < matlab.unittest.TestCase

    methods (Test)

      function testKnownReferenceValue1(testCase)
        
        D = 1.5;
        radius =  D / 2;
        actual = aspect_ratio_adjustment(radius, 2);
        expected = 0.9831;

        % From Ginoux (2003) Table 3:
        %  D = 1.5
        %  AR = 2
        %  reducution = 0.9831

        testCase.verifyEqual( ...
                actual, expected, ...
                "AbsTol", 1e-4);

      end

      function testKnownReferenceValue2(testCase)
        
        D = 5;
        radius =  D / 2;
        actual = aspect_ratio_adjustment(radius, 5);
        expected = 0.59;

        % From Ginoux (2003) Table 3:
        %  D = 5
        %  AR = 5
        %  reducution = 0.59

        testCase.verifyEqual( ...
                actual, expected, ...
                "AbsTol", 1e-3);

      end

      function testIncreasingAspectRatioDecreasesVelocity(testCase)

            D = 2.0;
            AR = 2:2:10;

            relative_reduction_in_settling_speed = ...
              aspect_ratio_adjustment(D, AR);

            r = 1-relative_reduction_in_settling_speed;

            testCase.verifyGreaterThan(r(2), r(1));
            testCase.verifyGreaterThan(r(3), r(2));
            testCase.verifyGreaterThan(r(4), r(3));
            testCase.verifyGreaterThan(r(5), r(4));

      end

    end

end
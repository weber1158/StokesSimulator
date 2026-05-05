# How to run MATLAB tests

### Why tests?
The `repo\tests\` folder contains MATLAB test files for the purpose of authenticating that the main Stokes' Law functions work correctly.

### Running the tests
1. Open the `repo\tests\` folder in MATLAB so that it becomes your current folder.
2. In the Command Window, execute:

```matlab
>> testBrowser
```
3. The `testBrowser` app will open within the MATLAB environment. There should be a <kbd>➕🔻</kbd> button in the `testBrowser` menu. Click the downward pointing arrow and select "Current Folder" from the list of options. This will import the test files into the app.
4. Click the green play <kbd>▶</kbd> button in the `testBrowser` menu. This will run all of the tests.
5. As of 05 May 2026, all tests are passing.

### What are the tests checking?
There are currently 3 test files, each with three test cases. Each test file compares the actual results of the Stokes' Law functions to reference values to confirm whether the calculations are accurate. The tests also ensure that the results of the functions scale properly; for example, the `testStokesLawModel` test checks whether doubling the particle diameter results in a settling velocity that is 4-times greater than the original particle diameter. The tests are conveniently named so that you know exactly what they are evaluating:

| Test File | Test Functions |
| :-- | :-- |
|`testAspectRatioAdjustment.m`| `testKnowReferenceValue1` |
|                           | `testKnowReferenceValue2` |
|                           | `testIncreasingAspectRatioDecreasesVelocity` |
|||
|`testStokesLawModel.m`|`testKnownReferenceValue`|
|                    |`testDiameterScaling`|
|                    |`testIncreasingDiameterIncreasesVelocity`|
|||
|`testStokesLawModelWater.m`|`testKnownReferenceValue`|
|                         |`testDiameterScaling`|
|                         |`testIncreasingDiameterIncreasesVelocity`|

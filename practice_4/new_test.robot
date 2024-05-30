*** Test Cases ***
Test Celsius To Fahrenheit Conversion
    ${celsius}=    Convert to number    100
    ${expected_fahrenheit}=    Convert to number    212
    ${actual_fahrenheit}=    Calculate Fahrenheit    ${celsius}
    Log    Actual Fahrenheit value: ${actual_fahrenheit}, Expected: ${expected_fahrenheit}
    Should Be Equal As Numbers    ${actual_fahrenheit}    ${expected_fahrenheit}

*** Keywords ***
Calculate Fahrenheit
    [Arguments]    ${celsius}
    ${fahrenheit}=    Evaluate    9/5 * ${celsius} + 32
    RETURN    ${fahrenheit}

TODO    Create custom log file with timestamp
*** Settings ***
Documentation    These are the test cases for login scenarios
Resource    ../Input Data/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/Ecommerce.robot
Test Setup    Common.Begin Test
Test Teardown    Common.Begin Teardown

# Run All: robot -d Results -T Tests\*robot
*** Test Cases ***
Test Login Scenarios
    [Documentation]  This is the templated login test cases
    [Tags]  Login
    [Template]  Validate Login Tests
    &{validLogin}
    &{invalidEmail}
    &{invalidPwd}


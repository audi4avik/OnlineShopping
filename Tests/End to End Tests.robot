*** Settings ***
Documentation    These are the test cases to test the checkout flow
Resource    ../Input Data/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/Ecommerce.robot

Test Setup    Common.Begin Test
Test Teardown    Common.Begin Teardown

*** Test Cases ***
Verify Booking Flow For Existing Customer
    [Tags]    Existing
    [Documentation]    Verify the end to end checkout flow for existing user
    Ecommerce.Select Item And Perform Checkout      ${URL}   ${screenshotDir}   @{loginCreds}

Verify Booking FLow For New Customer
    [Tags]    New
    [Documentation]    Verify the end to end checkout flow for new user
    Ecommerce.Select Item And Perform Checkout As New User      ${URL}    ${screenshotDir}   &{registerCreds}
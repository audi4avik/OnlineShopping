*** Settings ***
Documentation    Custom keywords for ecommerce tests
Resource    ./PO/LandingPage.robot
Resource    ./PO/ProductPage.robot
Resource    ./PO/OrderSummaryPage.robot
Resource    ./PO/SignInPage.robot
Resource    ./PO/RegisterPage.robot
Resource    ./PO/AddressSelectionPage.robot
Resource    ./PO/ShippingPage.robot
Resource    ./PO/PaymentPage.robot
Resource    ./PO/OrderConfirmationPage.robot

*** Keywords ***
# High level keywords
Validate Login Tests
    [Arguments]    &{creds}
    Navigate To Login Page
    Attempt Login And Validate Error    &{creds}


Select Item And Perform Checkout
    [Arguments]    ${URL}      ${screenshotDir}     @{loginCreds}
    Select Cloth Item       ${URL}
    Proceed With Cart Items
    Input User Information      @{loginCreds}
    Address And Shipping Methods
    Checkout And Confirmation       ${screenshotDir}

Select Item And Perform Checkout As New User
    [Arguments]    ${URL}      ${screenshotDir}     &{registerCreds}
    Select Cloth Item       ${URL}
    Proceed With Cart Items
    Register New User       &{registerCreds}
    Address And Shipping Methods
    Checkout And Confirmation       ${screenshotDir}

# Lower level keywrods
Select Cloth Item
    [Arguments]    ${URL}
    LandingPage.Navigate To Landing Page        ${URL}
    LandingPage.Click On Summer Dress From Menu
    ProductPage.Navigate To Specific Cloth Section
    ProductPage.Add Cloth To Cart

Proceed With Cart Items
    OrderSummaryPage.Verify Order Items

Input User Information
    [Arguments]    @{loginCreds}
    SignInPage.Provide Login Information        @{loginCreds}

Register New User
    [Arguments]    &{registerCreds}
    RegisterPage.Provide Signup Information       &{registerCreds}

Address And Shipping Methods
    AddressSelectionPage.Select Address For Checkout
    ShippingPage.Select Shipping Method

Checkout And Confirmation
    [Arguments]    ${screenshotDir}
    PaymentPage.Validate Order Details
    PaymentPage.Payment Method And Confirm
    OrderConfirmationPage.Validate The Order Confirmation
    OrderConfirmationPage.Take Page Screenshot    ${screenshotDir}

# Lower level keywords for login scenarios
Navigate To Login Page
    SignInPage.Go To Login Section

Attempt Login And Validate Error
    [Arguments]    &{creds}
    SignInPage.Enter Login Credentials      &{creds}



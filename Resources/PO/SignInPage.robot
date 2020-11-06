*** Settings ***
Documentation    This page holds login details objects
Library    SeleniumLibrary

*** Variables ***
${loginPageUrl} =    http://automationpractice.com/index.php?controller=authentication&back=my-account
${signInHeading} =    //h1[@class='page-heading']
${inputEmail} =     id=email
${inputPwd} =       id=passwd
${loginBtn} =       SubmitLogin
${alertTxt} =       //div[@class='alert alert-danger']//li
${successLoginTxt} =     //h1[text()='My account']
${logoutBtn} =      //a[@class='logout']

*** Keywords ***
Provide Login Information
    [Arguments]    @{loginCreds}
    wait until element is visible    ${signInHeading}
    scroll element into view    ${loginBtn}
    input text    ${inputEmail}     ${loginCreds}[0]
    input password    ${inputPwd}       ${loginCreds}[1]
    click element    ${loginBtn}

# Keywords for templated login
Go To Login Section
    go to   ${loginPageUrl}
    wait until element is visible    ${signInHeading}
    scroll element into view    ${loginBtn}

Enter Login Credentials
    [Arguments]    &{creds}
    input text    ${inputEmail}     ${creds.username}
    input password    ${inputPwd}   ${creds.password}
    click element    ${loginBtn}
    set selenium implicit wait    2 seconds
    ${isLoginSuccess}   run keyword and return status    element should be visible    ${successLoginTxt}
    run keyword if   ${isLoginSuccess}==True       Validate Successful Login    &{creds}
    ...     ELSE                Validate Error Message      &{creds}

Validate Successful Login
    [Arguments]    &{creds}
    ${loginMsg}     page should contain element    ${successLoginTxt}
    ${myAccTxt}     get text    ${successLoginTxt}
    should contain    ${myAccTxt}      ${creds.message}      ignore_case=True
    log     User Successfully logged in to ${successLoginTxt}
    click element    ${logoutBtn}

Validate Error Message
    [Arguments]    &{creds}
    wait until element is visible    ${alertTxt}
    ${errorMsg}    get text    ${alertTxt}
    should contain    ${errorMsg}      ${creds.message}       ignore_case=True



*** Settings ***
Documentation    this holds the objects for signup details
Library    SeleniumLibrary
Library    String

*** Variables ***
${resgiterHeading} =    //h1[text()='Authentication']
${emailField} =     id=email_create
${submitEmail} =    SubmitCreate
${createAccTxt} =       //h1[text()='Create an account']
${customerFirstName} =      customer_firstname
${customerLastName} =       customer_lastname
${passwrd} =        id=passwd
${dayDrpdwn} =      //select[@id='days']
${monthDrpdwn} =     //select[@id='months']
${yearDrpdwn} =      //select[@id='years']
${firstName} =      firstname
${lastName} =       lastname
${addressField1} =      id=address1
${cityField} =      city
${stateDrpdwn} =     id_state
${zipField} =       postcode
${mobileField} =    phone_mobile
${aliasField} =     alias
${registerBtn} =    submitAccount

*** Keywords ***
Provide Signup Information
    [Arguments]    &{registerCreds}
    wait until element is visible    ${resgiterHeading}
    ${email}    generate random string      5   [LOWER]
    input text    ${emailField}     ${email}@ymail.com
    click element    ${submitEmail}

    wait until element is visible    ${createAccTxt}

    input text    ${customerFirstName}      ${registerCreds.fname}
    input text    ${customerLastName}       ${registerCreds.fname}
    input password    ${passwrd}       audia8
    select from list by value     ${dayDrpdwn}     ${registerCreds.day}
    select from list by value     ${monthDrpdwn}    ${registerCreds.month}
    select from list by value     ${yearDrpdwn}     ${registerCreds.year}
    input text    ${firstName}     ${registerCreds.fname}
    input text    ${lastName}     ${registerCreds.lname}
    input text    ${addressField1}      ${registerCreds.address}
    input text    ${cityField}     ${registerCreds.city}
    select from list by label    ${stateDrpdwn}     ${registerCreds.state}
    input text    ${zipField}       ${registerCreds.zip}
    ${cellNum}     generate random string    10    [NUMBERS]
    input text    ${mobileField}    ${cellNum}
    input text    ${aliasField}     Home
    click element      ${registerBtn}



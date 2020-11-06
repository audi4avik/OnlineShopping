*** Settings ***
Documentation    This page holds login details objects
Library    SeleniumLibrary

*** Variables ***
${selectedAddress} =     //option[@selected='selected']
${addressCheckout} =        processAddress
${addressHead} =     //label[contains(text(),'Choose a delivery address')]

*** Keywords ***
Select Address For Checkout
    wait until element is visible       ${addressHead}
    ${selectedAdd}      get text    ${selectedAddress}
    should contain    ${selectedAdd}       Home
    scroll element into view    ${addressCheckout}
    click element    ${addressCheckout}


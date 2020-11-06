*** Settings ***
Documentation    This page holds objects for shipping
Library    SeleniumLibrary

*** Variables ***
${acceptTerms} =       //label[@for='cgv']
${shippingAcceptBtn} =      name=processCarrier

*** Keywords ***
Select Shipping Method
    scroll element into view    ${shippingAcceptBtn}
    click element    ${acceptTerms}
    click button     ${shippingAcceptBtn}
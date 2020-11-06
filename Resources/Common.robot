*** Settings ***
Documentation    This file holds the common resources
Library  SeleniumLibrary

*** Variables ***
${browser} =  chrome

*** Keywords ***
Begin Test
    open browser  about:blank   ${browser}
    maximize browser window

Begin Teardown
    close browser
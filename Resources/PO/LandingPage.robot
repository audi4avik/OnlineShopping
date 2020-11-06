*** Settings ***
Documentation    This holds the objects for landing page
Library    SeleniumLibrary

*** Variables ***
${sliderBtn} =    //div[@id='homepage-slider']//button[text()='Shop now !']
${womenLink} =      //a[@title='Women']
${summerDressLink} =    //div[@id='block_top_menu']/ul/li[1]/ul/li[2]/ul//a[@title='Summer Dresses']
${signInLink} =     //div[@class='header_user_info']//a[@class='login']

*** Keywords ***
Navigate To Landing Page
    [Arguments]    ${URL}
    go to    ${URL}
    wait until page contains element    ${sliderBtn}    timeout=10 seconds

Click On Summer Dress From Menu
    mouse over    ${womenLink}
    click element    ${summerDressLink}
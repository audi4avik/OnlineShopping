*** Settings ***
Documentation    this section holds the objects for order confirmation page
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${pageHead} =      //h3[@class='page-subheading']
${finalAmount} =    id=amount
${cnfOrder} =       //button/span[contains(text(),'I confirm my order')]
${backtoOrderLink} =    //a[@title='Back to orders']

*** Keywords ***
Validate The Order Confirmation
    wait until element is visible    ${pageHead}
    ${headTxt}      get text    ${pageHead}
    should contain    ${headTxt}       BANK-WIRE PAYMENT    ignore_case=True
    ${totalCharge}       get text        ${finalAmount}
    click element    ${cnfOrder}

Take Page Screenshot
    [Arguments]    ${screenshotDir}
    scroll element into view    ${backtoOrderLink}
    ${timeStamp}    get current date   exclude_millis=True
    ${random}       convert date      ${timeStamp}      result_format=%d%m%Y%H%M%S
    capture page screenshot    ${screenshotDir}confirmation_${random}.png
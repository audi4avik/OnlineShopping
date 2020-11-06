*** Settings ***
Documentation    This section holds the elements for Payment page
Library    SeleniumLibrary
Library    String

*** Variables ***
${orderItem} =      //p[@class='product-name']/a
${orderQuantity} =      //td[@class='cart_quantity text-center']/span
${wireTransfer} =       //a[@title='Pay by bank wire']
${priceLocator} =     //span[@id='total_price']

*** Keywords ***
Validate Order Details
    wait until element is visible    ${wireTransfer}
    ${itemName}    get text       ${orderItem}
    should contain     ${itemName}          Printed Summer Dress
    ${quantityTxt}     get text     ${orderQuantity}
    ${quantityTxt}     strip string    ${quantityTxt}
    should be equal as strings    ${quantityTxt}        1
    scroll element into view    ${wireTransfer}

Payment Method And Confirm
    click element    ${wireTransfer}

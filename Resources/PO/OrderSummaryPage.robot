*** Settings ***
Documentation    This page holds objects for order summary
Library     SeleniumLibrary

*** Variables ***
${cartPageHeading} =    //span[text()='Your shopping cart']
${totalPrice} =     //span[@id='total_price']
${priceValue} =     $30.98
${proceedToCheckout} =     (//a[@title='Proceed to checkout'])[2]

*** Keywords ***
Verify Order Items
    wait until element is visible    ${cartPageHeading}     timeout=10 seconds
    scroll element into view    ${proceedToCheckout}
    scroll element into view     ${totalPrice}
    ${price}    get text    ${totalPrice}
    should be equal as strings    ${price}      ${priceValue}
    click element    ${proceedToCheckout}

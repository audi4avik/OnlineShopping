*** Settings ***
Documentation    This holds the objects for product page
Library    SeleniumLibrary

*** Variables ***
${summerDressTxt} =     //span[@class='category-name' and contains(text(),'Summer Dresses')]
${summerDressItem} =    //*[@class='right-block']//a[contains(text(),'Printed Summer Dress')][1]
${addToCartBtn} =       //button/span[text()='Add to cart']
${popupWindow} =        id=layer_cart
${verifyItemAdded} =    //div[@class="layer_cart_product col-xs-12 col-md-6"]/h2
${checkoutBtn} =        //a[@title='Proceed to checkout']


*** Keywords ***
Navigate To Specific Cloth Section
    wait until element is visible    ${summerDressTxt}      timeout=10 seconds
    reload page
    set selenium speed    0.5
    execute javascript    window.scrollTo(0, 450)
    sleep    1 seconds
    click element    ${summerDressItem}
    wait until element is visible    ${addToCartBtn}
    scroll element into view    ${addToCartBtn}
    click element    ${addToCartBtn}
    set selenium speed    0


Add Cloth To Cart
    wait until element is visible     ${popupWindow}
    sleep   1 seconds
    ${addedTxt}     get text    ${verifyItemAdded}
    should contain    ${addedTxt}       Product successfully added to your shopping cart
    click element    ${checkoutBtn}
*** Settings ***
Documentation    Checkout Page



*** Keywords ***

verify added products and proceed
    [Arguments]     ${expected_list_of_products}
    log     ${expected_list_of_products}

    @{elements}=     Get WebElements     css:h4[class='media-heading']
    @{actual_list_products}=     Create List
    FOR     ${element}      IN      @{elements}
            Append To List  ${actual_list_products}     ${element.text}
    END
    lists should be equal  ${expected_list_of_products}    ${actual_list_products}      ignore_order=True
    click element   css:button[class='btn btn-success']
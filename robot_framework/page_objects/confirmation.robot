*** Settings ***
Documentation    Confirmation Page



*** Keywords ***

Enter the country and confirm
    [Arguments]     ${country}

    input text      country     ${country}
    Wait Until Page Contains Element    //a[text()='${country}']    timeout=10s
    click element   //a[text()='${country}']
    Sleep   1s
    click element   css:div[class='checkbox checkbox-primary'] label
    Sleep   1s
    click element   css:input[class='btn btn-success btn-lg']
    Wait Until Page Contains    Success!

*** Settings ***
Documentation    Shop Page



*** Keywords ***

verify succesful login
    wait until page contains element    css:a[class='nav-link btn btn-primary']     timeout=10s

verify card titles in the shop page

    @{expected_list}=   Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    @{elements}=     Get WebElements     css:h4[class='card-title']
    @{actual_list}=     Create List
    FOR     ${element}      IN      @{elements}
            Append To List  ${actual_list}     ${element.text}
    END
    lists should be equal  ${expected_list}    ${actual_list}
*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library     Collections
Library     String
Resource    resource.robot
Test Setup      Open the browser with mortgage payments url
Test Teardown   Close Browser
Test Template   TC1

*** Variables ***
${error_msg}    css:div[class='alert alert-danger col-md-12']

*** Keywords ***

fill the login form
    [Arguments]     ${username}     ${password}

    input text  username    ${username}
    sleep   1s
    input password  password    ${password}
    sleep   1s
    click button    signInBtn

check and display the error message
    wait until element is visible   ${error_msg}

verify error message

    ${result}=  get text    ${error_msg}
    should be equal as strings      ${result}   Incorrect username/password.

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

Select the card
    [Arguments]     ${cardname}

    @{elements}=     Get WebElements     css:h4[class='card-title']
    ${index}=   Set variable    1
    FOR     ${element}      IN      @{elements}
            Exit for loop If  '${element.text}' == '${cardname}'
            ${index}=   Evaluate   ${index} + 1
    END
    click button    (//div[@class='card-footer'])[${index}]/button

fill the login details and select the user option

    input text  username    ${user_name}
    sleep   1s
    input password  password    ${valid_password}
    sleep   1s
    click element   css:input[value='user']
    wait until element is visible    css:.modal-body
    click button   id:okayBtn
    click button   id:okayBtn
    wait until element is not visible   css:.modal-body
    Select From List By Value   css:.form-control    teach
    select checkbox     terms
    checkbox should be selected     terms

Select the link of child window

    click element   css:.blinkingText
    sleep   5

verify the user is switched to child window

    switch window   NEW
    element text should be  css:h1  DOCUMENTS REQUEST

grab the email id in the child window

    ${text}=    get text    css:p[class='im-para red']
    #log to console      ${text}
    @{words}=   split string    ${text}
    #log to console      ${words}
    ${email}=  Get From List   ${words}    4
    #log to console      ${email}
    set global variable   ${email}

switch to parent window and enter the email

    switch window   MAIN
    sleep   1s
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    input text  username    ${email}
    sleep   1s

TC1
    [Documentation]   Validate unsuccessful login
    [Arguments]     ${username}     ${password}

    fill the login form     ${username}    ${password}
    check and display the error message
    verify error message


*** Test Cases ***      username        password
Invalid Username        cdscc           learning
Invalid Password        rahulshetty     fdvdfv
Special Characters      @csddf#$$       learning



#TC2
#    [Documentation]   Validate cards displayed in shopping page
#
#    fill the login form     ${user_name}    ${valid_password}
#    verify succesful login
#    verify card titles in the shop page
#    Select the card     Blackberry
#
#TC3
#    [Documentation]   Validate navigation to child window
#
#    Select the link of child window
#    verify the user is switched to child window
#    grab the email id in the child window
#    switch to parent window and enter the email
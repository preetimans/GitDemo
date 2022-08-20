*** Settings ***
Documentation    landing page

*** Variables ***
${user_name}    rahulshettyacademy
${valid_password}     learning
${invalid_password}     12345678
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
*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
#Resource
Test Teardown   Close Browser

*** Variables ***
${error_msg}    css:div[class='alert alert-danger col-md-12']

*** Keywords ***
Open the browser with mortgage payments url
   create webdriver     Chrome
   go to    https://rahulshettyacademy.com/loginpagePractise/
   Maximize Browser Window

fill the login form
    input text  username    rahulshettyacademy
    input password  password    12345678
    click button    signInBtn

check and display the error message
    wait until element is visible   ${error_msg}

verify error message
    ${result}=  get text    ${error_msg}
    should be equal as strings      ${result}   Incorrect username/password.

*** Test Cases ***
TC1
    [Documentation]   Validate successful login

    Open the browser with mortgage payments url
    fill the login form
    check and display the error message
    verify error message


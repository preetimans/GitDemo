*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library     Collections
Library     ../custom_library/Shop.py
Library     String
Resource    ../page_objects/generic.robot
Resource    ../page_objects/landingpage.robot
Resource    ../page_objects/shop.robot
Resource    ../page_objects/checkout.robot
Resource    ../page_objects/confirmation.robot
Test Setup      Open the browser with mortgage payments url
Test Teardown   Close Browser

*** Variables ***
@{listofproducts}       Blackberry      iphone X

*** Test Cases ***
TC1
    [Documentation]   Validate unsuccessful login
    [Tags]      Smoke   Regression

    fill the login form     ${user_name}    ${invalid_password}
    check and display the error message
    verify error message

TC2
    [Documentation]   Validate cards displayed in shopping page
    [Tags]      Regression

    fill the login form     ${user_name}    ${valid_password}
    verify succesful login
    verify card titles in the shop page
    add items to card and checkout      ${listofproducts}
    verify added products and proceed   ${listofproducts}
    Enter the country and confirm       India


#TC3
#    [Documentation]   Validate navigation to child window
#
#    Select the link of child window
#    verify the user is switched to child window
#    grab the email id in the child window
#    switch to parent window and enter the email
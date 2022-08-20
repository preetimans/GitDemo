*** Settings ***
Documentation    Resource file

*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}     12345678
${valid_password}     learning
${url}      https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with mortgage payments url
   create webdriver     Chrome
   go to    ${url}
   Maximize Browser Window
   sleep    2s
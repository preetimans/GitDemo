*** Settings ***
Documentation    Resource file

*** Variables ***
${url}      https://rahulshettyacademy.com/loginpagePractise/
${browser}      Chrome

*** Keywords ***
Open the browser with mortgage payments url
   create webdriver     ${browser}
   go to    ${url}
   Maximize Browser Window
   sleep    2s
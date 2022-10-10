*** Settings ***
Documentation     All the page objects and keywords of login page
Library           SeleniumLibrary


*** Variables ***
${Error_Message_Login}  css:._9ay7

*** Keywords ***

Fill the login From
    [Arguments]     ${username}    ${password}
    input text  id:email     ${username}
    input password  id:pass     ${password}
    click button  name:login
Wait until Element is located in the page
    Wait Until Element Is Visible       ${Error_Message_Login}        timeout=10
Verify error message if user doesn't exist
    element text should be  ${Error_Message_Login}  The email address or mobile number you entered isn't connected to an account. Find your account and log in.
Verify error message if user exist
    element text should be  ${Error_Message_Login}  The password that you've entered is incorrect. Forgotten password?




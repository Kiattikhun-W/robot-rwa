*** Settings ***
Documentation     All the page objects and keywords of login page
Library           SeleniumLibrary


*** Variables ***
${signBtn}  xpath://button[@type='submit']
${errorMsg}    xpath://div[@role='alert']
${usernameHelperText}    id:username-helper-text
${inputTextUsername}    xpath://input[@id='username']
${inputTextPassword}    id:password-helper-text
*** Keywords ***
Check button disable
    Element Should Be Disabled    ${signBtn}

Fill the login only username
    [Arguments]     ${text}    ${checkOneInput}
    input text  id:username     ${text}
    Element Should Be Disabled    ${signBtn}
    RUN KEYWORD IF    '${checkOneInput}' == 'Yes'    Press Keys    ${inputTextUsername}    CTRL+A+DELETE

Fill the login only password
    [Arguments]     ${text}    ${checkOneInput}
    input text  id:password     ${text}
    LOG    ${checkOneInput}
    RUN KEYWORD IF    '${checkOneInput}' == 'Yes'    wait until element is visible    ${usernameHelperText}
    RUN KEYWORD IF    '${checkOneInput}' == 'Yes'    ELEMENT TEXT SHOULD BE  ${usernameHelperText}     Username is required
    Element Should Be Disabled    ${signBtn}

Check password helper text
    SELECT CHECKBOX    xpath://input[@name='remember']
    WAIT UNTIL ELEMENT IS VISIBLE    ${inputTextPassword}
    ELEMENT TEXT SHOULD BE  ${inputTextPassword}    Password must contain at least 4 characters

Fill the form with username and password
    [Arguments]     ${username}    ${password}
    INPUT TEXT    id:username    ${username}
    INPUT PASSWORD    id:password    ${password}

Sign in
    CLICK ELEMENT    ${signBtn}

validate error msg when sign in
    WAIT UNTIL ELEMENT IS VISIBLE    ${errorMsg}
    ELEMENT TEXT SHOULD BE  ${errorMsg}    Username or password is invalid
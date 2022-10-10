*** Settings ***
Documentation     All the page objects and keywords of content after login page
Library           SeleniumLibrary


*** Variables ***
${myAccountBtn}    xpath:(//a[@role='button'])[4]
${inputFirstName}    id:user-settings-firstName-input
${submitBtn}    xpath://button[@type='submit']
${sideNav}      //*[@data-test='sidenav-username']
*** Keywords ***

Wait my account screen display
    wait until element is visible    xpath:(//h2[normalize-space()='User Settings'])[1]
Update name
    ${result}=   get value    ${inputFirstName}
    Press Keys    ${inputFirstName}    zaza
    ${result}=   get value    ${inputFirstName}
#    ${sideText}=    get text    ${sideNav}
#    LOG    ${sideText}
    click element    ${submitbtn}
    Wait Until Element Contains     ${sideNav}      ${result}

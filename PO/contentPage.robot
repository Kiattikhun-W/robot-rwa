*** Settings ***
Documentation     All the page objects and keywords of content after login page
Library           SeleniumLibrary


*** Variables ***
${sideNav}  xpath://div[@class='MuiDrawer-root MuiDrawer-docked']
${myAccountBtn}    xpath:(//a[@role='button'])[4]
*** Keywords ***
Wait sidebar visible
    wait until element is visible    ${sideNav}
Click my account btn
    CLICK ELEMENT    ${myAccountBtn}

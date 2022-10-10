*** Settings ***
Documentation   To validate login form
Library  SeleniumLibrary
Library    Collections
#Do first
Test Setup      open the browser with the rwa url
#Do after test all case
Test Teardown  Close Browser Session

Resource       PO/loginPage.robot
Resource       PO/contentPage.robot
Resource       PO/myAccountPage.robot

Resource       resource/global.robot

*** Variables ***
${text}    terymc
${checkOneInput}    No
${invalidUsername}     admin
${invalidPassword}     admin

${validUsername}    Katharina_Bernier
${validPassword}    s3cret


*** Test Cases ***

#Validate login input only one input
#    ${checkOneInput}=   Set Variable    Yes
#    loginPage.Fill the login only username     ${text}    ${checkOneInput}
#    loginPage.Fill the login only password     ${text}    ${checkOneInput}
#
#Validate password helper text
#    ${checkOneInput}=   Set Variable    No
#    loginPage.Fill the login only username     ${text}    ${checkOneInput}
#    loginPage.Fill the login only password     1          ${checkOneInput}
#    loginPage.Check password helper text
#
##    LandingPage.wait until Element is located in the page
##    LandingPage.verify error message is correct
#
#Validate login Invalid account
#    loginPage.Fill the form with username and password    ${invalidUsername}       ${invalidPassword}
#    loginPage.Sign in
#    loginPage.validate error msg when sign in
#
#Validate login Valid account
#    loginPage.Fill the form with username and password    ${validUsername}      ${validPassword}
#    loginPage.Sign in
#    contentPage.Wait sidebar visible

Validate updatee account
    loginPage.Fill the form with username and password    ${validUsername}      ${validPassword}
    loginPage.Sign in
    contentPage.Wait sidebar visible
    contentPage.Click my account btn
    myAccountPage.Wait my account screen display
    myAccountPage.Update name


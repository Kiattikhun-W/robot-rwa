*** Settings ***
Documentation       A resource file
...
...                 The system
Library             SeleniumLibrary

*** Variables ***
${url}      http://localhost:3000/signin

*** Keywords ***
open the browser with the rwa url
     Create WebDriver   Chrome  executable_path=C:/Users/Tery/Documents/DriverPath/chromedriver.exe
     go to  ${url}
Close Browser Session
     close browser



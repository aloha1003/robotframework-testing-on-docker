*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library




*** Variables ***
${GOOGLE URL}         https://www.google.com/
${BROWSER}        Chrome
${DELAY}          0.1
${SearchField}     lst-ib
${Ruckus Site Url}     http://tw.ruckuswireless.com/

*** Keywords ***

Open Browser To Google Page
    Open Browser    ${GOOGLE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Google Page Should Be Open

Google Page Should Be Open
    Title Should Be    Google
Input KeyWord
    [Arguments]    ${keyword}
    Input Text    lst-ib   ${keyword}
    Press Key    xpath=//*[@id="lst-ib"]    \\27
    Click Button    xpath=//*[@id="tsf"]/div[2]/div[3]/center/input[2]
Go to Ruckus
    Location Should Be  ${Ruckus Site Url}
    Capture Page Screenshot


     


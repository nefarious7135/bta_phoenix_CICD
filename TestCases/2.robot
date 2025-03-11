*** Settings ***
Library     Browser    
Library     String

*** Variables ***
${WEB}                         http://the-internet.herokuapp.com/login
${BROWSER}                     chromium
${VIEWPORT}                    {'width': 1366, 'height': 768}
${wait_state_timeout}          5s


# Expect message
${msg_login}        You logged into a secure area!
${msg_logout}       You logged out of the secure area!
${msg_pass_inc}     Your password is invalid!
${msg_user_not}     Your username is invalid!

# xpath 
${txt_username}       //input[@id='username']
${txt_password}       //input[@id='password']
${btn_login}          //button[@type='submit']
${btn_logout}         //i[normalize-space(text())='Logout']
${txt_msg_success}    //div[@class='flash success']
${txt_msg_error}      //div[@class='flash error']

*** Keywords ***
Open Website 
    [Arguments]    ${RUN_BROWSER}=${BROWSER}    ${WEBSITE}=${WEB}
    New Browser    ${RUN_BROWSER}    headless=${False}
    New Context    viewport=${VIEWPORT}     ignoreHTTPSErrors=${True}
    New Page       ${WEBSITE}
    Set Browser Timeout    30s

Input Data On Text Box
    [Arguments]     ${Locator}    ${text}
    Type Text       ${Locator}    ${text}

Capture Image On Screen
    Take Screenshot       fullPage=${True}

Click Login Button
    Click    ${btn_login}

Click Logout Button
    Click    ${btn_logout}

ReplaceStrings
    [Arguments]    ${String}
    ${String}    Convert To String    ${String}
    ${String}    Replace String    ${String}    ['    ${empty}    
    ${String}    Replace String    ${String}    ']    ${empty}  
    Log    ${String}     
    RETURN    ${String}

Verify Text On Locator
    [Arguments]    ${Locator}    ${ExpMessage}
    ${ActMessage}    Get Text    ${Locator}
    ${ActMessage}    Split To Lines    ${ActMessage}    0    1
    ${ActMessage}    ReplaceStrings    ${ActMessage}
    ${ActMessage}    Strip String    ${ActMessage}
    Log    ${ActMessage}    
    Should Be Equal As Strings    ${ExpMessage}    ${ActMessage}

*** Test Cases ***
Login success 
    [Tags]    1 
    [Documentation]    http://the-internet.herokuapp.com/login 
    ...    1. Open browser and go to 'http://theinternet.herokuapp.com/login' 
    ...    2. Put username 'tomsmith' and password 'SuperSecretPassword!'. 
    ...    3. Click the 'Login' button. 
    ...    4. Click the 'Logout' button.   
    Open Website    RUN_BROWSER=${BROWSER}     WEBSITE=${WEB}
    Input Data On Text Box    ${txt_username}    tomsmith
    Input Data On Text Box    ${txt_password}    SuperSecretPassword!
    Click Login Button
    Verify Text On Locator    ${txt_msg_success}    ${msg_login} 
    Capture Image On Screen
    Click Logout Button
    Verify Text On Locator    ${txt_msg_success}    ${msg_logout} 
    Capture Image On Screen
    
Login failed - Password incorrect
    [Tags]    2 
    [Documentation]    http://the-internet.herokuapp.com/login 
    ...    1. Open browser and go to 'http://theinternet.herokuapp.com/login' 
    ...    2. Put username 'tomsmith' and password 'Password!'.  
    Open Website    RUN_BROWSER=${BROWSER}     WEBSITE=${WEB}
    Input Data On Text Box    ${txt_username}    tomsmith
    Input Data On Text Box    ${txt_password}    Password!
    Click Login Button
    Verify Text On Locator    ${txt_msg_error}    ${msg_pass_inc} 
    Capture Image On Screen

Login failed - Username not found
    [Tags]    3 
    [Documentation]    http://the-internet.herokuapp.com/login 
    ...    1. Open browser and go to 'http://theinternet.herokuapp.com/login' 
    ...    2. Put username 'tomholland' and password 'Password!'.  
    Open Website    RUN_BROWSER=${BROWSER}     WEBSITE=${WEB}
    Input Data On Text Box    ${txt_username}    tomholland
    Input Data On Text Box    ${txt_password}    Password!
    Click Login Button
    Verify Text On Locator    ${txt_msg_error}    ${msg_user_not} 
    Capture Image On Screen
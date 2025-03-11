*** Settings ***
Library     Selenium2Library   run_on_failure=Capture Page Screenshot
Library     String
# Library     Builtln
# Suite Teardown     Close browser
*** Variables ***
${url}          http://the-internet.herokuapp.com/login
${Browser}      chrome
${UserFail}     Your username is invalid!
${passFail}     Your password is invalid!
${login}        You logged into a secure area!
${logout}       You logged out of the secure area!

*** Test Cases ***
Login success
    [Tags]    01
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    Set Selenium Speed   0.3
    Input Text  id=username  tomsmith    
    Input Text  id=password  SuperSecretPassword!
    Click Element          //*[@id="login"]/button     
    ${result}  Get Text    //div[@class="flash success"]
    ${value} =    Split To Lines    ${result}      0   1
    Log To Console     \n${value}[0]
    Should Be Equal    ${value}[0]    ${login}
    Click Element          //*[@id="content"]/div/a     
    ${result}  Get Text    //div[@class="flash success"]
    ${value} =    Split To Lines    ${result}      0   1
    Log To Console     \n${value}[0]
    Should Be Equal    ${value}[0]    ${logout}

Login failed - Password incorrect
    [Tags]    02
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    Set Selenium Speed   0.3
    Input Text  id=username  tomsmith    
    Input Text  id=password  dfgdfdfhdf
    Click Element          //*[@id="login"]/button
    ${result}  Get Text    //div[@class="flash error"]
    ${value} =    Split To Lines    ${result}      0   1
    Log To Console     ${value}[0]
    Should Be Equal    ${value}[0]    ${passFail}

Login failed - Username not found    
    [Tags]    03
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    Set Selenium Speed   0.3
    Input Text  id=username  fdgfdhdfh    
    Input Text  id=password  SuperSecretPassword!
    Click Element          //*[@id="login"]/button
    ${result}  Get Text    //div[@class="flash error"]
    ${value} =    Split To Lines    ${result}      0   1
    Log To Console     ${value}[0]
    Should Be Equal    ${value}[0]    ${UserFail}
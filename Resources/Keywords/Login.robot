*** Settings ***
Resource          ../../init.robot

*** Keywords ***
Login
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${unidentifier}    ${pwidentifier}    ${test_data}
    Input Username And Password For Login    ${unidentifier}    ${pwidentifier}
    ${status_login_pass}    Run Keyword And Return Status    Verify Login Success    ${test_data}        
    IF    ${status_login_pass} == ${False}
              ${status_retry}    Run Keyword And Return Status    Verify Login Success    ${test_data}
              IF    ${status_retry} == ${False}
                        Input Username And Password For Login    ${unidentifier}    ${pwidentifier}
                        Verify Login Success    ${test_data}
              END  
    END
    Capture Image On Screen

Login Failed
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${unidentifier}    ${pwidentifier}    ${test_data}
    Input Username And Password For Login    ${unidentifier}    ${pwidentifier}
    ${status_login_pass}    Run Keyword And Return Status    Verify Login Success    ${test_data}    

Input Username And Password For Login
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${unidentifier}    ${pwidentifier}
    Click              ${btn_login_admd}  
    Waiting For Results     2s
    Click              ${btn_login_on_welcome}  
    Type Text          ${txt_unidentifier}        ${unidentifier}      
    Type Text          ${txt_pwidentifier}        ${pwidentifier}       
    Click              ${btn_login}
    Capture Image On Screen

Verify Login Success
    [Documentation]    Owner : kachan
    [Arguments]    ${test_data}     ${timeout}=10s
    Verify State On Selector        ${lbl_sidemenu_home}         visible        ${timeout}
    Verify Text On Selector         ${lbl_unidentifier_login}    ${${test_data}.verify_login.name}      
    Verify Text On Selector         ${lbl_status_login}          ${${test_data}.verify_login.status}
    Capture Image On Screen

Click Profile Button
    [Documentation]    Owner : kachan
    Click     ${img_profile_ais}  

Click Logout Button
    [Documentation]    Owner : kachan
    Verify State On Selector        ${lbl_logout}           visible
    Click     ${lbl_logout} 

Verify Logout Success
    [Documentation]    Owner : kachan
    Verify State On Selector        ${lbl_login}            visible
    Verify State On Selector        ${lbl_welcome}          visible
    Verify State On Selector        ${btn_login_admd}       visible
    Capture Image On Screen

Verify Message Login Fail On Alert Popup
    [Documentation]    Owner : kachan
    Verify Text On Selector        ${lbl_wrong_email_or_pwidentifier}            Wrong E-mail or Password
    Verify Text On Selector        ${lbl_please_check_email_or_pwidentifier}     Please check your Email or Password.
    Verify State On Selector       ${btn_close_popup}         visible
    Capture Image On Screen

Verify Message Login Fail On Page
    [Documentation]    Owner : kachan
    Verify Text On Selector        ${lbl_error_unidentifier}          Please fill username.
    Verify Text On Selector        ${lbl_error_pwidentifier}          Please fill password.
    Capture Image On Screen

    

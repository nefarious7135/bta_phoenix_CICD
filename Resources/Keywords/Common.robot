*** Settings ***
Resource          ../../init.robot
Documentation  This Common File Is Common Keyword  group For Testing.

*** Keywords ***
#Keyword Description        : Keyword ใช้สำหรับการล็อกอินเข้าสู่ระบบ 
#Keyword Argument           : ${LoginU} : Username ที่ใช้ในการรล็อกอินเข้าสู่ระบบ
#                           : ${LoginP} : Password สำหรับการรล็อกอินเข้าสู่ระบบ
#Keyword Return             : -
#Keyword Create by          : Noona 24/02/2022
Login Sky
    [Arguments]             ${LoginU}                           ${LoginP}
    ${FlagHomePage}         Run Keyword And Return Status       Wait Until Element Is Visible   ${Label_SignIn}         20s
    Run Keyword If          '${FlagHomePage}' != 'True'         Fail                            Failed, Page login not appear in given times.

Open Website On Screen
    [Documentation]    Owner : Kachain.A
    [Arguments]    ${RUN_BROWSER}=${BROWSER}    ${WEBSITE}=${WEB.IOT}
    New Browser    ${RUN_BROWSER}    headless=${False}
    New Context    viewport=${VIEWPORT}     ignoreHTTPSErrors=${True}
    New Page       ${WEBSITE}
    Set Browser Timeout    30s

Get Text And Should Match Regexp
    [Documentation]    Owner: Kachain.A
    [Arguments]    ${locator}        ${pattern}          
    Wait For Elements State          ${locator}     state=visible     timeout=${wait_state_timeout}  
    ${value}       Get Text 	     ${locator}  
    ${match}       Should Match Regexp        ${value}     ${pattern}
    [Return]       ${value}

Verify Text On Selector
    [Documentation]    Owner: Kachain.A
    [Arguments]    ${selector}    ${expect_text}
    ...    ${ignore_case}=${False}    ${strip_spaces}=${False}    ${collapse_spaces}=${False}
    ${actual_text}    Get Text    ${selector}
    ${match}    Should Be Equal As Strings    ${actual_text}    ${expect_text}
    ...    ignore_case=${ignore_case}    strip_spaces=${strip_spaces}    collapse_spaces=${collapse_spaces}
    ...    msg=The text of element '${selector}' should have been '${expect_text}' but in fact it was '${actual_text}'

Waiting For Results
    [Documentation]    Owner: Kachain.A
    [Arguments]  ${time}=2s
    Sleep  ${time}

Capture Image On Screen
    [Documentation]    Owner : Kachain.A
    Take Screenshot       fullPage=${True}

Verify State On Selector
    [Documentation]    Owner : Kachain.A
    ...    (default wait for element state timeout = 5s)
    ...    support state follow Browser library such = visible, hidden, enabled, disabled, selected, stable and etc.
    [Arguments]    ${selector}    ${expect_state}       ${timeout}=5s    
    Wait For Elements State       ${selector}           state=${expect_state}    timeout=${timeout}

Get Current Url
   [Documentation]    Owner: Kachain.A
   ${current_url}      Get Url 	 
   ${current_url}      Should Match Regexp        ${current_url}     .+
   [Return]    ${current_url}

Select Product ${name}
    [Documentation]    Owner : Kachain.A
    ...  Support Select Product Name On Screen: "Home" , "Customer" , "Mobile Postpaid" , "Fiber Broadband"
    ...  "Enterprise" , "Transaction" , "Common".
    ${status}    Run Keyword And Return Status    Verify State On Selector       xpath=(${lst_product}//span[text()="${name}"])[1]     visible
    IF  ${status}==${True}
        Click    xpath=(${lst_product}//span[text()="${name}"])[1]
    ELSE
        Capture Image On Screen
        Fail    msg=Please check product is ${name} on screen.
    END

Select Menu ${name}
    [Documentation]    Owner : Kachain.A
    ...  Support Select Menu Name On Screen: "Summary" , "Conductor" , "Customer Orders" , "Subscriber"
    ...  "Service" , "Order Complete" , "Audit Trail" , "Information" , "Sky-Scheduler" , "Sky-Authorize"
    ...  "Sky-Tools" , "Symptom".
    ${status}    Run Keyword And Return Status    Verify State On Selector       xpath=(${lst_menu}//span[text()="${name}"])[1]     visible
    IF  ${status}==${True}
        Click    xpath=(${lst_menu}//span[text()="${name}"])[1]
    ELSE
        Capture Image On Screen
        Fail    msg=Please check menu is ${name} on screen.
    END
    
Select Sub Menu ${name}
    [Documentation]    Owner : Kachain.A
    ...  Support Select Sub Menu Name On Screen: "Instances" , "Tasks".
    ${status}    Run Keyword And Return Status    Verify State On Selector       xpath=(${lst_sub_menu}//span[text()="${name}"])     visible
    IF  ${status}==${True}
        Click    xpath=(${lst_sub_menu}//span[text()="${name}"])
    ELSE
        Capture Image On Screen
        Fail    msg=Please check sub menu is ${name} on screen.
    END

Select Order Tab ${name}
    [Documentation]    Owner : Kachain.A
    ...  Support Select Order Tab Name On Screen: "Suspend" , "Mobile-Profile" , "Change-Product" , "Reconnect"
    ...  "Register" , "Mobile-Account".
    ${status}    Run Keyword And Return Status    Verify State On Selector       xpath=${lst_order_tab}//span[text()="${name}"]     visible
    IF  ${status}==${True}
        Click    xpath=${lst_order_tab}//span[text()="${name}"]
        Verify State On Selector    xpath=${tab_active}//span[text()="${name}"]    visible
    ELSE
        Capture Image On Screen
        Fail    msg=Please check order tab name is ${name} on screen.
    END

Click Fields Button And Set To Select All
    [Documentation]    Owner : Kachain.A
    ...  Keyword Description: สำหรับการกดเลือก Select All
    Verify State On Selector      ${btn_filter_fields}     visible
    Click    ${btn_filter_fields}
    ${status}    Run Keyword And Return Status    Verify State On Selector      ${btn_select_all}     visible    3s
    IF  ${status}
        Click    xpath=${btn_select_all}
        Verify State On Selector    xpath=${btn_select_all}    hidden
        Capture Image On Screen
    END
    Click    ${btn_close_field_popup}
    

Select Start Date
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเลือก Start Date
    [Arguments]    ${StartDate}
    ${Mon}    Convert Month    ${StartDate}
    ${Day}    Convert Day    ${StartDate}
    ${Year}    Convert Year    ${StartDate}
    Click    ${lst_cal_menu}
    Click    //span[@aria-label="${Mon} ${Day}, ${Year}"]

Select End Date
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเลือก End Date    
    [Arguments]    ${EndDate}
    ${Mon}    Convert Month    ${EndDate}
    ${Day}    Convert Day    ${EndDate}
    ${Year}    Convert Year    ${EndDate}
    Click    //span[@aria-label="${Mon} ${Day}, ${Year}"]

Convert Year
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเลือกตัดแปลงค่า yyyy-mm-dd hh:mm:ss ให้เหลือแค่ปีค.ศ.อย่างเดียว     
    ...    Ex. 2023
    [Arguments]    ${Year}
    ${Year}    Split String    ${Year}    ${SPACE}
    ${Year}    Set Variable    ${Year[0]}
    ${Year}       Convert Date    ${Year}    result_format=%Y-%m-%d
    ${Year}     Convert Date     ${Year}      result_format=%Y
    [Return]     ${Year}

Convert Month
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเลือกตัดแปลงค่า yyyy-mm-dd hh:mm:ss ให้เหลือแค่เดือนอย่างเดือน      
    ...    Ex. June 
    [Arguments]    ${Month}
    ${Month}    Split String    ${Month}    ${SPACE}
    ${Month}    Set Variable    ${Month[0]}
    ${Month}       Convert Date    ${Month}    result_format=%Y-%m-%d
    ${Month}    Convert Date     ${Month}      result_format=%B
    [Return]     ${Month}

Convert Day
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเลือกตัดแปลงค่า yyyy-mm-dd hh:mm:ss ให้เหลือแค่วันอย่างเดียว      
    [Arguments]    ${Day}
    ${Day}    Split String    ${Day}    ${SPACE}
    ${Day}    Set Variable    ${Day[0]}
    ${Day}    Convert Date    ${Day}    result_format=%Y-%m-%d
    ${Day}    Convert Date     ${Day}      result_format=%d
    ${Day}    Evaluate    str(int($Day))    # เปลี่ยนจาก string เป็น integer และกลับเป็น string โดยไม่มี 0 ข้างหน้า
    [Return]     ${Day}

Get Current Year On Calendar  
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเก็บวันที่ปัจจุบันในปฏิทิน ตัดให้เหลือแค่ ปีปัจจุบัน Ex. 2023
    ${DateTime}     Get Property    ${lst_date_time}    name
    ${DateTime}    Split String    ${DateTime}    to
    ${DateTime}    Set Variable    ${DateTime[0]}
    ${DateTime}    Split String    ${DateTime}    ${SPACE}
    ${DateTime}    Set Variable    ${DateTime[0]}
    ${CurrentYear}    Convert Date     ${DateTime}      result_format=%Y
    [Return]     ${CurrentYear}

Select Year On Calendar
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับเช็คปีใช้กดในปฏิทิน
    [Arguments]    ${CurrentYear}    ${InputYear}
    IF  "${CurrentYear}" > "${InputYear}"
        ${result}  Evaluate    ${CurrentYear}-${InputYear}
        Click    ${lst_cal_menu}
        FOR  ${i}  IN RANGE    ${result}
            Click    ${btn_cal_down}
            Sleep    1s
        END  
    ELSE IF    "${CurrentYear}" < "${InputYear}"
        Fail    msg=ไม่กดสามารถเพิ่มปีค.ศ.ได้
    ELSE    
        Click    ${lst_cal_menu}
        Log    message=คลิกเลือก เดือน/วัน ต่อได้เลย
    END 

Select Month on Calendar
    [Documentation]    Owner : Sutat   
    [Arguments]    ${Month}
    Select Options By    ${ddl_lst_month}     Text    ${Month}

Select Create Date
    [Documentation]    Owner : Sutat    Editor: Nichakorn.S
    ...    Keyword Description : สำหรับกดเลือก วัน/เดือน/ปี ในปฏิทิน
    [Arguments]    ${StartDate}    ${EndDate}
    ${CurrentYear}     Get Current Year On Calendar
    ${InputYear}       Convert Year    ${StartDate}
    Select Year On Calendar    ${CurrentYear}    ${InputYear}
    ${Month}     Convert Month    ${StartDate}
    Select Month on Calendar     ${Month}
    Select Start Date            ${StartDate}   
    Select End Date              ${EndDate}
    ${Hour}    ${Min}    ${sec}    Convert Values Time          ${EndDate}
    Choose Time On Calendar    ${Hour}    ${Min}    ${sec}
    Capture Image On Screen
    Click                        ${area_content_page}
    Verify State On Selector     ${pnl_datetimepicker}        hidden
    Sleep    3s
    Capture Image On Screen
    

Search By Other Criteria
    [Documentation]    Owner : Nichakorn.S
    ...  Keyword Description: สำหรับการค้นหา Criteria ในรูปแบบอื่นๆ
    [Arguments]    ${menu_criteria}
    Click Criteria Button
    Select Criteria For Search    ${menu_criteria}

Click Criteria Button
    [Documentation]    Owner : Nichakorn.S
    ...  Keyword Description: สำหรับการกดเลือกปุ่ม Criteria 
    Verify State On Selector      ${btn_filter_criteria}     visible
    Hover                         ${btn_filter_criteria}

Select Criteria For Search
    [Documentation]    Owner : Panithan.b        Editor: Nichakorn.S
    ...  Keyword Description: สำหรับการกดเลือก Checkbox Criteria โดยให้ส่ง Value ที่ต้องการคลิกมา
    [Arguments]    ${menu_criteria}
    ${length}    Get Length    ${menu_criteria}   
    
    FOR  ${i}  IN RANGE    0    ${length}
         
        Click Criteria Button
        ${status}    Run Keyword And Return Status    
        ...    Verify State On Selector    xpath=${cbx_filter}/span[normalize-space(text())="${menu_criteria}[${i}]"]/../input[1]     visible    5s

        IF  ${status}==${True}            
            Click    xpath=${cbx_filter}/span[normalize-space(text())="${menu_criteria}[${i}]"]/../input[1]
            Waiting For Results         
            Capture Image On Screen
        END
        Click    ${area_content_page}
    END


Select Number Of Row Display In Table ${data_num}
    [Documentation]    Owner : Nichakorn.S
    ...  Keyword Description: สำหรับการกดเลือกเพื่อแสดง data ตามจำนวนที่เลือก
    Verify State On Selector      ${lbl_show_data_default}     visible
    Click                         ${lbl_show_data_default}
    ${status}    Run Keyword And Return Status    Verify State On Selector        
    ...    ${ddl_show_data}/a[text()="${data_num}"]          visible    3s
    
    IF  ${status}==${True}
        Click    ${ddl_show_data}/a[text()="${data_num}"]
        Waiting For Results
        Capture Image On Screen
    ELSE
        Capture Image On Screen
        Fail    msg=Please check data of row display in table on screen.
    END

Select Criteria
    [Documentation]    Owner : Panithan.b
    ...  Keyword Description: สำหรับการกดเลือก Criteria ให้ส่ง value ที่ต้องการคลิกมา
    [Arguments]    ${menu_criteria}
    ${length}    Get Length    ${menu_criteria}   
    FOR  ${i}  IN RANGE    0    ${length}
        # Log    ${menu_criteria}[${i}]  
        Click Criteria Button
        ${status}    Run Keyword And Return Status    
        ...    Verify State On Selector    xpath=${cbx_filter}/span[normalize-space(text())="${menu_criteria}[${i}]"]/../input[1]     visible    5s

        IF  ${status}==${True}            
            Click    xpath=${cbx_filter}/span[normalize-space(text())="${menu_criteria}[${i}]"]/../input[1]       
            # Verify State On Selector        ${txt_err_msg}       visible     5s           
            Capture Image On Screen
        END
        Click    ${area_content_page}
    END

Choose Time On Calendar
    [Arguments]    ${Hour}    ${Min}    ${sec} 
    Type Text    ${txt_cal_hour}   ${Hour}
    Type Text    ${txt_cal_min}    ${Min}
    Type Text    ${txt_cal_sec}     ${sec}

Convert Values Time
    [Arguments]    ${EndDate}
    ${EndDate}    Split String    ${EndDate}    ${SPACE}
    ${EndDate}    Set Variable    ${EndDate[1]}
    ${EndDate}    Replace String    ${EndDate}    :    ${SPACE}
    ${EndDate}    Split String    ${EndDate}    ${SPACE}
    ${Hour}    Set Variable    ${EndDate[0]}
    ${Min}    Set Variable    ${EndDate[1]}
    ${sec}    Set Variable    ${EndDate[2]}
    [Return]    ${Hour}    ${Min}    ${sec} 

Verify Create Date  
    [Documentation]    Owner : Sutat    
    ...    Keyword Description : สำหรับ Verify Create Date
    [Arguments]     ${ExpectDate}    ${ActualDate}
    ${ExpectDate}    Split String    ${ExpectDate}    to
    ${StartDate}    Set Variable    ${ExpectDate[0]}
    ${EndDate}    Set Variable    ${ExpectDate[1]}
    ${StartDate}    Convert Date    ${StartDate}    result_format=%d-%m-%Y %H:%M:%S
    ${EndDate}    Convert Date    ${EndDate}    result_format=%d-%m-%Y %H:%M:%S
    Should Be True    '${StartDate}' <= '${ActualDate}' <= '${EndDate}'
    Log Many    ${StartDate}    ${ActualDate}    ${EndDate}
    
Get Current Create Date And Verify Create Date
    [Documentation]    Owner : Sutat    
    ...    Keyword Description : สำหรับดึง Create Date ในตารางและ Verify
    [Arguments]     ${locator}    
    ${Expect_Date}    Get Property    ${lst_date_time}    name
    ${Count}    Get Element Count    ${locator}
    FOR    ${i}    IN RANGE    1    ${Count}+1
        ${Actual_Date}    Get Text    (${locator})[${i}]
        Verify Create Date    ${Expect_Date}    ${Actual_Date}
    END    

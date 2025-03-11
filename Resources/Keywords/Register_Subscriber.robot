*** Settings ***
Resource          ../../init.robot

*** Keywords ***
#id
Input Search Id
    [Documentation]    Owner : Kachain.A
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search Id
    [Arguments]    ${testcase}
    Type Text      ${btn_search_id}        txt=${${testcase}.id}
    Click          ${area_content_page}  

Verify Data In Table By Search Id
    [Documentation]    Owner : kachan
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_table_id}    #${count}=1
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${id}    Get Text    xpath=(${lst_result_table_id})[${index}]
        Log      ${id}       console=${True}
        Should Be Equal    ${id}    ${${testcase}.id}
    END
    Capture Image On Screen

Verify Data In Table Query By Search Id
    [Documentation]    Owner : kachan
    [Arguments]    ${testcase}
    ${queryResult}    Query Single Filter    ${${testcase}.query}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_table_id}
    FOR  ${index}  IN RANGE    1     ${count}+1
        ${id}    Get Text    xpath=(${lst_result_table_id})[${index}]
        Log      ${id}       console=${True}
        Should Be Equal    ${id}    ${queryResult}[${index-1}]
    END
    Capture Image On Screen


#date
Verify Data In Table By Search Create Date
    [Documentation]    Owner : xxxx
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_table_create_date}
    FOR  ${index}  IN RANGE    1     ${count}+1
        ${date}    Get Text    xpath=(${lst_result_table_create_date})[${index}]
        Log      ${date}       console=${True}
        Should Be Equal    ${date}    ${${testcase}.create_date}
    END
    Capture Image On Screen


#error_message
Input Search error_message
    [Documentation]    Owner : wichuda.n    Editor: Nichakorn.S
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search error_message
    [Arguments]    ${testcase}    
    Type Text      ${txt_err_msg}        txt=${${testcase}.search_conditions.error_message}
    Click          ${area_content_page}  
    Capture Image On Screen


Verify Data In Table By error_message
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_err_message}
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${msg}    Get Text    xpath=(${lst_result_err_message})[${index}]
        Log      ${msg}       console=${True}
        Should Be Equal    ${msg}    ${${testcase}.search_conditions.error_message}
    END
    Capture Image On Screen


#url
Input Search URI
    [Documentation]    Owner : wichuda.n    Editor: Nichakorn.S
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search url
    [Arguments]    ${testcase}
    Type Text      ${txt_url}                txt=${${testcase}.search_conditions.uri}
    Click          ${area_content_page} 
    Capture Image On Screen


Verify Data In Table By URI
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_url}
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${uri}    Get Text    xpath=(${lst_result_url})[${index}]
        Log      ${uri}       console=${True}
        Should Be Equal    ${uri}    ${${testcase}.search_conditions.uri}
    END
    Capture Image On Screen



#Multi privateId Type and privateId Value
Input Search Multi privateId Type and privateId Value
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search Multi privateId Type and privateId Value
    [Arguments]    ${testcase}
    Type Text      ${txt_privateIdType}        txt=${${testcase}.search_conditions.private_id_type}
    Type Text      ${txt_privateIdValue}        txt=${${testcase}.search_conditions.private_id_value}
    Click          ${area_content_page}  
    Capture Image On Screen


Verify Data In Table By private Type and privateId Value
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${privateIdType}     ${privateIdValue}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_privateIdType}
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${type}     Get Text         xpath=(${lst_result_privateIdType})[${index}]        
        ${value}     Get Text        xpath=(${lst_result_privateIdValue})[${index}]
        Log       ${type}           console=${True}
        Log       ${value}           console=${True}
        Should Be Equal    ${type}    ${privateIdType}
        Should Be Equal    ${value}    ${privateIdValue}
    END
    Capture Image On Screen




#Multi publicIdType Type and publicIdValue Value
Input Search Multi publicIdType Type and publicIdValue Value
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search Multi publicIdType Type and publicIdValue Value
    [Arguments]    ${testcase}
    Type Text      ${txt_publicIdType}        txt=${${testcase}.search_conditions.public_id_type}
    Type Text      ${txt_publicIdValue}        txt=${${testcase}.search_conditions.public_id_value}
    Click          ${area_content_page}  
    Capture Image On Screen


Verify Data In Table By publicIdType Type and publicIdValue Value
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${publicIdType}     ${publicIdValue}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_publicIdType}
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${type}     Get Text         xpath=(${lst_result_publicIdType})[${index}]        
        ${value}     Get Text        xpath=(${lst_result_publicIdValue})[${index}]
        Log       ${type}           console=${True}
        Log       ${value}           console=${True}
        Should Be Equal    ${type}    ${publicIdType}
        Should Be Equal    ${value}    ${publicIdValue}
    END
    Capture Image On Screen
    



#state
Select State
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    FOR    ${index_state}  ${i}  IN ENUMERATE       @{${testcase}.state}
            Click        ${ddl_state}
            Verify State On Selector         xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']    expect_state=visible
            Click                            xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']   
            Sleep                            3s  
            ${count_data_found}              Get Results Found And Verify On Subscriber
            ${status_no_data}    Run Keyword And Return Status   Verify State On Selector    ${lbl_no_data_avilable}     visible
            IF  ${status_no_data} == ${False}
                    ${count}    Get Element Count    ${lst_result_table_state}
                    FOR  ${index}  IN RANGE    1     ${count}+1
                        ${state}    Get Text         ${lst_result_table_state}\[${index}]
                        Log      ${state}            console=${True}
                        Should Be Equal              ${state}    ${${testcase}.state[${index_state}]}
                    END
                    IF    int(${count_data_found}) >= int(${100})    Should Be True    int(${100}) == int(${count})
                    ...    ELSE                                      Should Be True    int(${count_data_found}) == int(${count})
                    Capture Image On Screen
            ELSE
                 Log       ${${testcase}.state[${index_state}]} is "No data Available"      console=${True}    
                 Capture Image On Screen
            END
            Click                           xpath=//div[@id="vs1__combobox"]//span[normalize-space(text())='${${testcase}.state[${index_state}]}']/..//span[@class='feather-icon select-none relative']
            Verify State On Selector        xpath=//div[@id="vs1__combobox"]//span[normalize-space(text())='${${testcase}.state[${index_state}]}']    
            ...    expect_state=hidden
    END

Select State For Multi Case
    [Documentation]    Owner : Nichakorn.S
    [Arguments]    ${testcase}
    FOR    ${index_state}  ${i}  IN ENUMERATE       @{${testcase}.state}
            Click        ${ddl_state}
            Verify State On Selector         xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']    expect_state=visible
            Click                            xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']   
            Sleep                            3s  
            ${count_data_found}              Get Results Found And Verify On Subscriber
            ${status_no_data}    Run Keyword And Return Status   Verify State On Selector    ${lbl_no_data_avilable}     visible
            IF  ${status_no_data} == ${False}
                    ${count}    Get Element Count    ${lst_result_table_state}
                    FOR  ${index}  IN RANGE    1     ${count}+1
                        ${state}    Get Text         ${lst_result_table_state}\[${index}]
                        Log      ${state}            console=${True}
                        Should Be Equal              ${state}    ${${testcase}.state[${index_state}]}
                    END
                    IF    int(${count_data_found}) >= int(${100})    Should Be True    int(${100}) == int(${count})
                    ...    ELSE                                      Should Be True    int(${count_data_found}) == int(${count})
                    Capture Image On Screen
            ELSE
                 Log       ${${testcase}.state[${index_state}]} is "No data Available"      console=${True}    
                 Capture Image On Screen
            END
            Capture Image On Screen 
    END

#method
Select Method
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    FOR    ${index_method}  ${i}  IN ENUMERATE       @{${testcase}.method}
            Click        ${ddl_method}
            Verify State On Selector         xpath=//ul[@id="vs4__listbox"]//li[normalize-space(text())='${${testcase}.method[${index_method}]}']    expect_state=visible
            Click                            xpath=//ul[@id="vs4__listbox"]//li[normalize-space(text())='${${testcase}.method[${index_method}]}']   
            Sleep                            3s  
            ${count_data_found}              Get Results Found And Verify On Subscriber
            ${status_no_data}    Run Keyword And Return Status   Verify State On Selector    ${lbl_no_data_avilable}     visible
            IF  ${status_no_data} == ${False}
                    ${count}    Get Element Count    ${lst_result_table_method}
                    FOR  ${index}  IN RANGE    1     ${count}+1
                        ${method}    Get Text         ${lst_result_table_method}\[${index}]
                        Log      ${method}            console=${True}
                        Should Be Equal              ${method}    ${${testcase}.method[${index_method}]}
                    END
                    IF    int(${count_data_found}) >= int(${100})    Should Be True    int(${100}) == int(${count})
                    ...    ELSE                                      Should Be True    int(${count_data_found}) == int(${count})
                    Capture Image On Screen
            ELSE
                 Log       ${${testcase}.method[${index_method}]} is "No data Available"      console=${True}    
                 Capture Image On Screen
            END
    END



# Get Results Found And Verify On Subscriber
#     [Documentation]    Owner : wichuda.n
#     ${result_ddl_show_data}    Get Text And Should Match Regexp    ${lbl_show_data_default}     .+
#     ${result_table_found}      Get Text And Should Match Regexp    ${txt_table_result}               .+
#     @{split_string_result}     Split String    ${result_table_found}
#     ${number_result}           Set Variable    ${split_string_result}[0]    
#     IF  int(${number_result}) <= int(${10})
#              ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${10})
#              IF  ${status} == ${False}  
#                      Click Dropdown List Show Data Button
#                      Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${10}"]    visible
#                      Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${10}"]
#                      ${compare_value}    Set Variable    int(${10})
#              END
#     ELSE IF   int(${number_result}) > int(${10}) and int(${number_result}) <= int(${20})
#              ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${20})
#              IF  ${status} == ${False}  
#                      Click Dropdown List Show Data Button
#                      Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${20}"]    visible
#                      Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${20}"]
#                      ${compare_value}    Set Variable    int(${20})
#              END
#    ELSE IF   int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) <= int(${30})
#              ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${20})
#              IF  ${status} == ${False}  
#                      Click Dropdown List Show Data Button
#                      Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${30}"]    visible
#                      Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${30}"]
#                      ${compare_value}    Set Variable    int(${30})
#              END
#     ELSE IF   int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) > int(${30}) and int(${number_result}) >= int(${50})
#             ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${20})
#              IF  ${status} == ${False}  
#                      Click Dropdown List Show Data Button
#                      Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${50}"]    visible
#                      Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${50}"]
#                      ${compare_value}    Set Variable    int(${50})
#              END
#     ELSE    
#             ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${20})
#              IF  ${status} == ${False}  
#                      Click Dropdown List Show Data Button
#                      Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${100}"]    visible
#                      Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${100}"]
#                      ${compare_value}    Set Variable    int(${100})
#              END
#              ${log_message}    Catenate
#              ...        ${\n}Current dropdown list show maximum = 100 on page.
#              ...        ${\n}Current result found = "${number_result}"
#              Log        ${log_message}     console=${True}
#     END
#     Verify State On Selector   ${lbl_show_data_default}       visible
#     ${result_ddl_show_data}    Get Text And Should Match Regexp    ${lbl_show_data_default}     .+
#     Should Be True             int(${result_ddl_show_data}) == ${compare_value}
#     Capture Image On Screen
    
    
Click Dropdown List Show Data Button
    [Documentation]    Owner : wichud.n
    ...  Keyword Description: สำหรับการกดเลือก dropdown List 
    Verify State On Selector      ${lbl_show_data_default}      visible
    Click                         ${lbl_show_data_default} 
    Capture Image On Screen

Get Results Found And Verify On Subscriber
    [Documentation]    Owner : wichuda.n
    ${result_ddl_show_data}    Get Text And Should Match Regexp    ${lbl_show_data_default}     .+
    ${result_table_found}      Get Text And Should Match Regexp    ${txt_table_result}               .+
    @{split_string_result}     Split String    ${result_table_found}
    ${number_result}           Set Variable    ${split_string_result}[0]
    Capture Image On Screen  
    ${number}    Set Variable If
    ...     int(${number_result}) <= int(${10})                                                                                                                          ${10}
    ...     int(${number_result}) > int(${10}) and int(${number_result}) <= int(${20})                                                                                   ${20}
    ...     int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) <= int(${30})                                            ${30}
    ...     int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) > int(${30}) and int(${number_result}) <= int(${50})     ${50}
    ...     int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) > int(${30}) and int(${number_result}) > int(${50})      ${100}
    ${status}    Run Keyword And Return Status    Should Be True    int(${result_ddl_show_data}) == int(${number})
    IF  ${status} == ${False}  
            Click Dropdown List Show Data Button
            Verify State On Selector      xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${number}"]    visible
            Click                         xpath=//ul[@class="vs-component vs-dropdown--menu"]//a[text()="${number}"]
            Sleep    5s
            Capture Image On Screen
    END
    IF  int(${number_result}) > int(${10}) and int(${number_result}) > int(${20}) and int(${number_result}) > int(${30}) and int(${number_result}) > int(${50})
             ${log_message}    Catenate
             ...        ${\n}Current dropdown list show maximum = 100 on page.
             ...        ${\n}Current result found = "${number_result}"
             Log        ${log_message}     console=${True}
    END
    Verify Dropdown List Are Change   ${number}
    Verify Count Data In Table        ${number}    ${number_result}
    Capture Image On Screen
    [RETURN]    ${number_result}

Verify Dropdown List Are Change
    [Documentation]    Owner : wichuda.n
    ...  ${number_dropdown_list} = Format จำนวน Dropdown list ที่ต้องการเช็ค
    [Arguments]    ${number_dropdown_list}
    Verify State On Selector   ${lbl_show_data_default}       visible
    ${result_ddl_show_data}    Get Text And Should Match Regexp    ${lbl_show_data_default}     .+
    Should Be True             int(${result_ddl_show_data}) == ${number_dropdown_list}

Verify Count Data In Table
    [Documentation]    Owner : wichuda.n
    ...  ${number_dropdown_list} = Format จำนวน Dropdown list ที่ต้องการเช็ค
    ...  ${number_found_result} = จำนวนที่ Found data ใน table ที่ต้องการเช็ค
    [Arguments]    ${number_dropdown_list}    ${number_found_result}
    ${count_row_data}    Get Element Count    ${tbl_row_data}
    Should Be True     int(${count_row_data}) <= int(${number_dropdown_list})
    Should Be True     int(${count_row_data}) == int(${number_found_result})
    Capture Image On Screen

Verify Row Result Data In Table
    [Documentation]    Owner : Nichakorn.S
    ...  Keyword Description: สำหรับการนับจำนวน Row Data ในตาราง
    
    ${get_num_ddl} =    Get Text    ${lbl_show_data_default}
    ${status}    Run Keyword And Return Status    
    ...    Verify State On Selector          ${tbl_data}     visible    3s
    ${count_row_data}    Get Element Count    ${tbl_row_data}

    Log    The number of row data is ${count_row_data} .
    Log    The number of get text from dropdown is ${get_num_ddl} .
    
    Verify Amount Of Row    ${get_num_ddl}    ${count_row_data}
    Waiting For Results    time=1s
    Capture Image On Screen


Verify Amount Of Row
    [Documentation]    Owner : Nichakorn.S
    ...  Keyword Description: สำหรับการ Verify จำนวน Row Data 
    [Arguments]    ${get_num_ddl}   ${count_row_data}
     
    IF    ${count_row_data} <= ${get_num_ddl}
        IF    ${count_row_data} > 0
            Log     The number of data is ${count_row_data} less than or equal to the dropdown value ${get_num_ddl} .     console=yes
        ELSE
            Log    Data not found or The number of data iszero.    console=yes
        END
    ELSE
        Log    The number of data is ${count_row_data} more than the dropdown value ${get_num_ddl} .     console=yes
    END
    Waiting For Results    time=1s
    Capture Image On Screen     





#state Tasks
Select State Task
    [Documentation]    Owner : wichuda.n        Editor: Nichakorn.S
    [Arguments]    ${testcase}
    FOR    ${index_state}  ${i}  IN ENUMERATE       @{${testcase}.state}
            Click        ${dtp_state_task}
            Verify State On Selector         xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']    expect_state=visible
            Click                            xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']   
            Sleep                            3s  
            ${count_data_found}              Get Results Found And Verify On Subscriber
            ${status_no_data}    Run Keyword And Return Status   Verify State On Selector    ${lbl_no_data_avilable}     visible
            IF  ${status_no_data} == ${False}
                    ${count}    Get Element Count    ${lst_result_table_state_task}
                    FOR  ${index}  IN RANGE    1     ${count}+1
                        ${state}    Get Text         ${lst_result_table_state_task}\[${index}]
                        Log      ${state}            console=${True}
                        Should Be Equal              ${state}    ${${testcase}.state[${index_state}]}
                    END
                    IF    int(${count_data_found}) >= int(${100})    Should Be True    int(${100}) == int(${count})
                    ...    ELSE                                      Should Be True    int(${count_data_found}) == int(${count})
                    Capture Image On Screen
            ELSE
                 Log       ${${testcase}.state[${index_state}]} is "No data Available"      console=${True}    
                 Capture Image On Screen
            END
            Click                           xpath=//div[@id="vs1__combobox"]//span[normalize-space(text())='${${testcase}.state[${index_state}]}']/..//span[@class='feather-icon select-none relative']
            Verify State On Selector        xpath=//div[@id="vs1__combobox"]//span[normalize-space(text())='${${testcase}.state[${index_state}]}']    
            ...    expect_state=hidden
            Capture Image On Screen 
    END

Select State Task For Multi Case
    [Documentation]    Owner : Nichakorn.S
    [Arguments]    ${testcase}
    FOR    ${index_state}  ${i}  IN ENUMERATE       @{${testcase}.state}
            Click        ${dtp_state_task}
            Verify State On Selector         xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']    expect_state=visible
            Click                            xpath=//ul[@id="vs1__listbox"]//li[normalize-space(text())='${${testcase}.state[${index_state}]}']   
            Sleep                            3s  
            ${count_data_found}              Get Results Found And Verify On Subscriber
            ${status_no_data}    Run Keyword And Return Status   Verify State On Selector    ${lbl_no_data_avilable}     visible
            IF  ${status_no_data} == ${False}
                    ${count}    Get Element Count    ${lst_result_table_state_task}
                    FOR  ${index}  IN RANGE    1     ${count}+1
                        ${state}    Get Text         ${lst_result_table_state_task}\[${index}]
                        Log      ${state}            console=${True}
                        Should Be Equal              ${state}    ${${testcase}.state[${index_state}]}
                    END
                    IF    int(${count_data_found}) >= int(${100})    Should Be True    int(${100}) == int(${count})
                    ...    ELSE                                      Should Be True    int(${count_data_found}) == int(${count})
                    Capture Image On Screen
            ELSE
                 Log       ${${testcase}.state[${index_state}]} is "No data Available"      console=${True}    
                 Capture Image On Screen
            END
            Capture Image On Screen 
    END

#instance id
Input Search Instance Id
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Search Id
    [Arguments]    ${testcase}
    Type Text      ${txt_instance_id}        txt=${${testcase}.search_conditions.instance_id}
    Click          ${area_content_page}  
    Capture Image On Screen

Verify Data In Table By Search Instance Id
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_instance_id}   
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${instance}    Get Text    xpath=(${lst_result_instance_id})[${index}]
        Log      ${instance}       console=${True}
        Should Be Equal    ${instance}    ${${testcase}.search_conditions.instance_id}
    END
    Capture Image On Screen


#name
Input Search Name
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Name
    [Arguments]    ${testcase}
    Type Text      ${txt_name}        txt=${${testcase}.search_conditions.name}
    Click          ${area_content_page}  
    Capture Image On Screen

Verify Data In Table By Search Name
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_name}   
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${name}    Get Text    xpath=(${lst_result_name})[${index}]
        Log      ${name}       console=${True}
        Should Be Equal    ${name}    ${${testcase}.search_conditions.name}
    END
    Capture Image On Screen


#error message task
Input Search Error Message Tasks
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย Error Message
    [Arguments]    ${testcase}
    Type Text      ${txt_err_msg_task}        txt=${${testcase}.search_conditions.error_message}
    Click          ${area_content_page}  
    Capture Image On Screen

Verify Data In Table By Error Message Tasks
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_err_msg_task}   
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${name}    Get Text    xpath=(${lst_result_err_msg_task})[${index}]
        Log      ${name}       console=${True}
        Should Be Equal    ${name}    ${${testcase}.search_conditions.error_message}
    END
    Capture Image On Screen


#external system task
Input Search External System
    [Documentation]    Owner : wichuda.n
    ...  Keyword Description: สำหรับค้นหาข้อมูลด้วย External System
    [Arguments]    ${testcase}
    Type Text      ${txt_external_system}        txt=${${testcase}.search_conditions.external_system}
    Click          ${area_content_page}  
    Capture Image On Screen

Verify Data In Table By External System
    [Documentation]    Owner : wichuda.n
    [Arguments]    ${testcase}
    Waiting For Results    time=10s
    ${count}    Get Element Count    ${lst_result_external_system}   
    FOR  ${index}  IN RANGE    1     ${count}+1        
        ${name}    Get Text    xpath=(${lst_result_external_system})[${index}]
        Log      ${name}       console=${True}
        Should Be Equal    ${name}    ${${testcase}.search_conditions.external_system}
    END
    Capture Image On Screen
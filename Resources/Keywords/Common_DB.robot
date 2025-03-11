*** Settings ***
Resource          ../../init.robot
Library        DatabaseLibrary
Documentation  This CommonDB File Is Keyword Group For Manage DB.
*** Variables ***
${DBHost}         10.252.53.34
${DBName}         PHXIOTDB
${DBPass}         sky#sa22
${DBPort}         1533
${DBUser}         skymposa

*** Keywords ***
#Keyword Description        : Connect database 
#Keyword Argument           : -
#Keyword Return             : -
#Keyword Create By          : Poon 13/05/2020
#Keyword Modify by          : Nat  16/05/2020  >> แก้ตัวแปรในส่วนของ Connect 
Connect Database 
    Connect To Database Using Custom Params    cx_Oracle    user='', password='', dsn=''

Connect to Oracle Database
    [Documentation]    Owner : xxxx
    ...   Keyword Description: ใช้เชื่อมต่อ Database
    Connect to Database
    ...    cx_Oracle
    ...    dbName=${DBName}
    ...    dbUsername=${DBUser}
    ...    dbPassword=${DBPass}
    ...    dbHost=${DBHost}
    ...    dbPort=${DBPort}

Query Multi Filters
    [Documentation]    Owner : xxxx
    ...   Keyword Description: ใช้เมื่อคำสั่ง SQL รีเทิร์นหลายรายการและคุณต้องการแปลงทั้งหมดในผลลัพธ์ให้อยู่ในรูปแบบของรายการ (list)
    [Arguments]    ${query}
    @{queryResults}	  Query	  ${query}
    Log Many	 @{queryResults}
    ${list_response}    Create List
    ${output}     Evaluate    list($queryResults[0])
    FOR    ${tuple}    IN    @{output}
        ${item}=    Set Variable    ${tuple}
        Append To List    ${list_response}    ${item}
    END
    Log Many    ${list_response}
    [Return]    ${list_response}

Query Single Filter
    [Documentation]    Owner : xxxx
    ...   Keyword Description: ใช้เมื่อคำสั่ง SQL เฉพาะรายการแรก (row แรก) ในผลลัพธ์ หรือเมื่อผลลัพธ์คาดหวังเป็นการคืนค่าเดี่ยว (single value)
    [Arguments]    ${query}
    @{queryResults}	  Query	  ${query}
    Log Many	 @{queryResults}
    ${list_response}    Create List
    ${output}     Evaluate    list($queryResults)
    FOR    ${tuple}    IN    @{output}
        ${item}=    Set Variable    ${tuple[0]}
        Append To List    ${list_response}    ${item} 
    END
    Log Many    ${list_response}
    [Return]    ${list_response} 


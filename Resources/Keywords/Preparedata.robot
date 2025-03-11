*** Settings ***
Resource          ../../init.robot

*** Keywords ***
#Keyword Description        : This keyword is Prepare Data
#Keyword Require Argument   : ${ExcelFile} = path ไฟล์ Excel (InputData) 
#Keyword Create By          : -
#Keyword Modify by          : Noona 07/03/2022 
Prepare Data
    [Arguments]                 ${ExcelFile}
    ${GetDataExcel}             Fetch Config Data From Excel            ${ExcelFile}
    Set Test Variable           ${URLSky}                               ${GetDataExcel[0]['URL']}

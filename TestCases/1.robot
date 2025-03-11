*** Settings ***
Library     String
Library     Collections

*** Variables ***

 

*** Test Cases ***
Check Dup and Create new list
    [Tags]    1 
    ${A}    create list    1    2    3    5    6    8    9
    ${B}    create list    3    2    1    5    6    0
    ${C}    create list
    FOR    ${i}      IN    @{A}    
        List Should Contain Value     ${B}    ${i}    ignore_case=${True}
        Append To List    ${C}    ${i}
    END
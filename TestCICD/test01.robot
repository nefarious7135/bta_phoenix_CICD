*** Settings ***
Library     String
Library     RequestsLibrary
Library     JSONLibrary
*** Variables ***
@{Exp_data}    12    rachel.howell@reqres.in    Rachel    Howell    https://reqres.in/img/faces/12-image.jpg
@{Param}    id      email    first_name    last_name    avatar

 
*** Keywords ***
ReplaceStrings
    [Arguments]    ${JSON}
    ${JSON}    Convert To String    ${JSON}
    ${JSON}    Replace String    ${JSON}    ['    ${empty}    
    ${JSON}    Replace String    ${JSON}    ']    ${empty} 
    ${JSON}    Replace String    ${JSON}    [    ${empty} 
    ${JSON}    Replace String    ${JSON}    ]    ${empty}  
    Log    ${JSON}     
    RETURN    ${JSON}

GetDataAndVerify
    [Arguments]    ${Exp_list}    ${Json}    ${Param_list}
    ${length}    Get length    ${Exp_list}    
    FOR    ${i}     IN RANGE    ${length}    
        FOR    ${Param}    ${Exp}    IN    ${Param_list}    ${Exp_list}
            ${Act}	 Get Value From Json	    ${Json}	    $..${Param}[${i}]
            ${Act}    ReplaceStrings    ${Act}
            Log Many    ${Exp}[${i}]     ${Act}  
            Should Be Equal    ${Exp}[${i}]     ${Act}       
        END
    END


*** Test Cases ***
Get user profile success 
    [Tags]    200 
    [Documentation]    API https://reqres.in/api/users/12
    ...    1. Verify response status code should be ‘200’
    ...    2. Compare the response body with expected below. 
    ...    ‘ID’ == 12 
    ...    ‘Email’ == rachel.howell@reqres.in 
    ...    ‘First Name’ == Rachel 
    ...    ‘Last Name’ == Howell 
    ...    ‘Avatar’ == https://reqres.in/img/faces/12-image.jpg

    Create Session    mysession    https://reqres.in
    ${RES}    GET On Session    mysession    /api/users/12    expected_status=200
    ${RES}  Set Variable    ${RES.json()}
    GetDataAndVerify    ${Exp_data}    ${RES}    ${Param}  

Get user profile but user not found 
    [Tags]    404 
    [Documentation]    API https://reqres.in/api/users/1234
    ...    1. Verify response status code should be ‘404’. 
    ...    2. Response body should be '{}' 
       
    Create Session    mysession    https://reqres.in
    ${RES}    GET On Session    mysession    /api/users/1234    expected_status=404
    ${RES}  Set Variable    ${RES.json()}
    Should Be Empty    ${empty}    ${RES}    


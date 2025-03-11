*** Settings ***
Library   REST

*** Test Cases ***
Get user profile success
    GET      https://reqres.in/api/users/12
    Integer               response status             200
    Integer               $..id                       12
    String                $..email                    rachel.howell@reqres.in
    String                $..first_name               Rachel
    String                $..last_name                Howell
    String                $..avatar                   https://reqres.in/img/faces/12-image.jpg


Get user profile but user not found
    GET      https://reqres.in/api/users/1234
    Integer               response status             404
    Object                response body               {}     
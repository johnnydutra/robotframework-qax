*** Settings ***
Documentation    ssss
Resource         ../resources/Base.resource
Resource         ../../libs/Data.resource
Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Should Be Able To Update Measures

    ${data}    Get JSON Fixture    data    update
    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account And Membership    ${data}

    Login With Document    ${data}[account][cpf]
    User Is Logged In

    Tap My Body
    Update Measures    ${data}[account]
    Popup Should Have Text    Seu cadastro foi atualizado com sucesso

    Get User Token
    ${account}    Get Account By Name    ${data}[account][name]

    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]
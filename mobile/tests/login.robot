*** Settings ***
Documentation    Login tests

Resource    ../resources/Base.resource
Resource    ../../libs/Data.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Should Login With IP And CPF
    ${data}    Get JSON Fixture    data    login
    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account And Membership    ${data}

    Login With Document    ${data}[account][cpf]
    User Is Logged In

Should Not Login With Unregistered CPF
    Login With Document    48487877001
    Popup Should Have Text    Acesso não autorizado! Entre em contato com a central de atendimento

Should Not Login With Invalid CPF
    Login With Document    00000014144
    Popup Should Have Text    CPF inválido, tente novamente
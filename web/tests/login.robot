*** Settings ***
Documentation    Login scenarios

Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Should Login As Manager
    Go To Login Page
    Submit Login Form    ${ADMIN}[email]    ${ADMIN}[password]
    User Is Logged In    ${ADMIN}[email]

Should Not Login With Incorrect Password
    [Tags]    login_fail
    Go To Login Page
    Submit Login Form    ${ADMIN}[email]    abc123
    Toast Message Should Be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Should Not Login With Unregistered Email
    [Tags]    login_fail
    Go To Login Page
    Submit Login Form    404@smartbit.com    abc123
    Toast Message Should Be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Login Attempt With Invalid Input
    [Template]    Attempt Login And Verify Notice Message
    ${EMPTY}             ${EMPTY}                Os campos email e senha são obrigatórios.
    ${ADMIN}[email]    ${EMPTY}                Os campos email e senha são obrigatórios.
    ${EMPTY}             ${ADMIN}[password]    Os campos email e senha são obrigatórios.
    www.test.com         abc123                  Oops! O email informado é inválido
    sac#mail.com         abc123                  Oops! O email informado é inválido

*** Keywords ***
Attempt Login And Verify Notice Message
    [Arguments]    ${email}    ${password}    ${expected_message}
    Go To Login Page
    Submit Login Form    ${email}    ${password}
    Notice Error Message Should Be    ${expected_message}
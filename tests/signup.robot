*** Settings ***
Documentation       User sign up scenarios
Resource            ../resources/base.resource
Test Setup          Start Session
Test Teardown       Take Screenshot

*** Variables ***
${DEFAULT_NAME}     Johnny Test
${DEFAULT_EMAIL}    test@test.com
${DEFAULT_CPF}      09364208048

*** Test Cases ***
Should Initiate User Signup
    [Tags]    smoke
    ${account}    Create Dictionary
    ...    name=${DEFAULT_NAME}
    ...    email=${DEFAULT_EMAIL}
    ...    cpf=${DEFAULT_CPF}

    Delete Account By Email    ${DEFAULT_EMAIL}

    Submit Signup Form    ${account}
    Verify Welcome Message

Signup Attempt With Invalid Data
    [Template]    Attempt Signup And Verify Error Message
    ${EMPTY}           ${DEFAULT_EMAIL}    ${DEFAULT_CPF}    Por favor informe o seu nome completo
    ${DEFAULT_NAME}    ${EMPTY}            ${DEFAULT_CPF}    Por favor, informe o seu melhor e-mail
    ${DEFAULT_NAME}    ${DEFAULT_EMAIL}    ${EMPTY}          Por favor, informe o seu CPF
    ${DEFAULT_NAME}    test%invalid.com    ${DEFAULT_CPF}    Oops! O email informado é inválido
    ${DEFAULT_NAME}    test*invalid.com    ${DEFAULT_CPF}    Oops! O email informado é inválido
    ${DEFAULT_NAME}    test.com.br         ${DEFAULT_CPF}    Oops! O email informado é inválido
    ${DEFAULT_NAME}    ${DEFAULT_EMAIL}    00000000          Oops! O CPF informado é inválido
    ${DEFAULT_NAME}    ${DEFAULT_EMAIL}    fsghdndf          Oops! O CPF informado é inválido

*** Keywords ***
Attempt Signup And Verify Error Message
    [Arguments]    ${name}    ${email}    ${cpf}    ${error_message}
    ${account}    Create Dictionary    
    ...    name=${name}    
    ...    email=${email}
    ...    cpf=${cpf}

    Submit Signup Form    ${account}
    Notice Error Message Should Be    ${error_message}
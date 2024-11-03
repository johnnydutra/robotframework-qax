*** Settings ***
Documentation    Landing Page elements and actions
Library    Browser

*** Keywords ***

Submit Signup Form
    [Arguments]    ${account_data}

    Get Text    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name     ${account_data}[name]
    Fill Text    id=email    ${account_data}[email]
    Fill Text    id=cpf      ${account_data}[cpf]

    Click        css=button >> text=Cadastrar
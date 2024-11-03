*** Settings ***
Documentation    Login Page elements and actions
Library          Browser

*** Keywords ***
Go To Login Page
    Go To    http://localhost:3000/login

Submit Login Form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[name='email']       ${email}
    Fill Text    css=input[type='password']    ${password}
    Click        css=button >> text=Entrar
*** Settings ***
Documentation    New membership page elements and actions
Library          Browser

Resource         ../components/Toast.resource

*** Keywords ***
Select Account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label='select_account']    ${name}
    Click        css=[data-testid='${cpf}']

Select Plan
    [Arguments]    ${plan}
    Fill Text    css=input[aria-label='select_plan']    ${plan}
    Click        div[id*='option'] >> text=${plan}

Fill Credit Card Data
    [Arguments]    &{card_data}
    Fill Text    css=input[name='card_number']    ${card_data}[number]
    Fill Text    css=input[name='card_holder']    ${card_data}[holder]
    Fill Text    css=input[name='card_month']     ${card_data}[exp_month]
    Fill Text    css=input[name='card_year']      ${card_data}[exp_year]
    Fill Text    css=input[name='card_cvv']       ${card_data}[cvv]

Finish Membership Enrollment
    Click    css=button[type='submit']
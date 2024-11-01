*** Settings ***
Documentation    Toast component elements and actions
Library          Browser

*** Keywords ***

Toast Message Should Be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.Toastify__toast-body    visible    5s
    Get Text    css=.Toastify__toast-body    equal    
    ...         ${expected_text}
*** Settings ***
Documentation    Toast component elements and actions
Library          Browser

*** Keywords ***

Toast Message Should Be
    [Arguments]    ${expected_text}

    ${toast_selector}    Set Variable    .Toastify__toast-body

    Wait For Elements State    
    ...    css=${toast_selector}
    ...    state=visible    
    ...    timeout=5s

    Get Text    
    ...    css=${toast_selector}    
    ...    assertion_operator=equal    
    ...    assertion_expected=${expected_text}
    
    Take Screenshot    selector=${toast_selector}
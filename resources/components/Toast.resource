*** Settings ***
Documentation    Toast component elements and actions
Library          Browser

*** Keywords ***

Toast Message Should Be
    [Arguments]    ${expected_text}

    ${toast}    Set Variable    css=.Toastify__toast-body

    Wait For Elements State    
    ...    element=${toast}
    ...    state=visible    
    ...    timeout=5s

    Get Text    
    ...    selector=${toast}    
    ...    assertion_operator=equal    
    ...    assertion_expected=${expected_text}
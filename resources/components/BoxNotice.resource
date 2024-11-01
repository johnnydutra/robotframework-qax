*** Settings ***
Documentation    BoxNotice component elements and actions
Library          Browser

*** Keywords ***

Notice Error Message Should Be
    [Arguments]    ${expected_text}

    ${notice}    Set Variable    css=form .notice
    
    Wait For Elements State    
    ...    element=${notice}    
    ...    state=visible    
    ...    timeout=5s

    Get Text    
    ...    selector=${notice}    
    ...    assertion_operator=equal    
    ...    assertion_expected=${expected_text}
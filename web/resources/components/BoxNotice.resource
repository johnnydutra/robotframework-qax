*** Settings ***
Documentation    BoxNotice component elements and actions
Library          Browser

*** Keywords ***

Notice Error Message Should Be
    [Arguments]    ${expected_text}

    ${notice}    Set Variable    form .notice
    
    Wait For Elements State    
    ...    css=${notice}    
    ...    state=visible    
    ...    timeout=5s

    Get Text    
    ...    css=${notice}    
    ...    assertion_operator=equal    
    ...    assertion_expected=${expected_text}
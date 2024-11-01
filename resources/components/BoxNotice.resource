*** Settings ***
Documentation    BoxNotice component elements and actions
Library          Browser

*** Keywords ***

Notice Error Message Should Be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=form .notice
    
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${expected_text}
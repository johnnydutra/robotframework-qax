*** Settings ***
Documentation    Accounts page elements and actions

Library    Browser

*** Keywords ***

User Is Logged In
    [Arguments]    ${user_email}

    ${element}    Set Variable    css=.logged-user
    
    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${user_email}
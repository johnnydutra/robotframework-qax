*** Settings ***
Documentation    Accounts page elements and actions
Library          Browser

*** Keywords ***

User Is Logged In
    [Arguments]    ${user_email}

    ${logged_user_label}    Set Variable    css=.logged-user
    
    Wait For Elements State    
    ...    selector=${logged_user_label}
    ...    state=visible
    ...    timeout=5s

    Get Text    
    ...    selector=${logged_user_label}
    ...    assertion_operator=equal
    ...    assertion_expected=${user_email}
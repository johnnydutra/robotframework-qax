*** Settings ***
Documentation    Actions and elements in the Popup component
Library          AppiumLibrary

*** Keywords ***
Popup Should Have Text
    [Arguments]    ${text}
    ${element}    Set Variable    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.TextView

    Wait Until Element Is Visible    ${element}
    Element Text Should Be    ${element}    ${text}
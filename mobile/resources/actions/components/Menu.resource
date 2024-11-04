*** Settings ***
Documentation    Navigation menu
Library    AppiumLibrary

*** Keywords ***
Tap My Account
    Click Element    xpath=//android.widget.Button[@content-desc="Minha conta, tab, 1 of 2"]/android.widget.TextView

Tap My Body
    Click Element    xpath=//android.widget.Button[@content-desc="Meu corpo, tab, 2 of 2"]/android.widget.TextView
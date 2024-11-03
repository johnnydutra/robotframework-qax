*** Settings ***
Documentation    Welcome Page elements and actions
Library    Browser

*** Keywords ***

Verify Welcome Message
    Wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5
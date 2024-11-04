*** Settings ***
Documentation    Main file

Library          AppiumLibrary

Resource         ../../libs/DB.resource

Resource         ./actions/Account.resource
Resource         ./actions/Login.resource
Resource         ./actions/MyBody.resource

Resource         ./actions/components/Menu.resource
Resource         ./actions/components/Popup.resource

*** Keywords ***
Start Session
    Open Application    
    ...    remote_url=http://localhost:4723
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    app=${CURDIR}/../../smartbit/app/smartbit-beta.apk
    ...    autoGrantPermissions=true
    
    Wait Until Page Contains    IP da API    30s

Finish Session
    Capture Page Screenshot
    Close Application
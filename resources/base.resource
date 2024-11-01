*** Settings ***

Documentation    Main repo file

Library          Browser

Library          libs/Account.py

Resource         ./DB.resource

Resource         ./pages/Accounts.resource
Resource         ./pages/Landing.resource
Resource         ./pages/Login.resource
Resource         ./pages/Welcome.resource

Resource         ./components/BoxNotice.resource
Resource         ./components/Toast.resource

*** Keywords ***

Start Session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000
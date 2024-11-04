*** Settings ***

Documentation    Main repo file

Library          Browser
Library          JSONLibrary

Library          ../../libs/Account.py

Resource         ../../libs/Data.resource
Resource         ../../libs/DB.resource

Resource         ./pages/Accounts.resource
Resource         ./pages/Landing.resource
Resource         ./pages/Login.resource
Resource         ./pages/Memberships.resource
Resource         ./pages/NewMembership.resource
Resource         ./pages/Welcome.resource

Resource         ./components/BoxNotice.resource
Resource         ./components/Modal.resource
Resource         ./components/Navbar.resource
Resource         ./components/Toast.resource

*** Variables ***
&{ADMIN}    email=sac@smartbit.com    password=pwd123

*** Keywords ***

Start Session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

Sign In With Admin User
    Go To Login Page
    Submit Login Form    ${ADMIN}[email]    ${ADMIN}[password]
    User Is Logged In    ${ADMIN}[email]

Enroll New Member
    [Arguments]    ${data}
    Go To Memberships Page
    Start New Membership Enrollment
    Select Account    ${data}[account][name]    ${data}[account][cpf]
    Select Plan    ${data}[plan][name]
    Fill Credit Card Data    &{data}[credit_card]
    Finish Membership Enrollment
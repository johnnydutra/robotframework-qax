*** Settings ***
Documentation    Memberships page elements and actions
Library          Browser

Resource         ../components/Toast.resource

*** Keywords ***
Start New Membership Enrollment
    Click    css=a[href='/memberships/new']
    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible    5s
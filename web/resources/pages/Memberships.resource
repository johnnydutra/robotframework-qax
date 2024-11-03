*** Settings ***
Documentation    Memberships page elements and actions
Library          Browser

Resource         ../components/Toast.resource

*** Keywords ***
Start New Membership Enrollment
    Click    css=a[href='/memberships/new']
    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible    5s

Filter Membership By Name
    [Arguments]    ${name}
    Fill Text    css=input[placeholder^='Busque']    ${name}
    Wait For Elements State    css=strong >> text=Total: 1    visible    5s
    Wait For Elements State    css=table tbody tr >> text=${name}    visible    5s

Delete Membership By Name
    [Arguments]    ${name}
    Click    xpath=//td[text()='${name}']/..//button

Should Not Have Membership
    [Arguments]    ${name}
    Wait For Elements State    css=table tbody tr >> text=${name}    detached    5s
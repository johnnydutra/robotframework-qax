*** Settings ***
Documentation    ssss
Resource         ../resources/Base.resource
Resource         ../../libs/Data.resource
Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Should Be Able To Update Measures

    ${data}    Get JSON Fixture    data    update

    Login With Document    ${data}[account][cpf]
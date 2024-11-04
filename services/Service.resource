*** Settings ***
Documentation    API integration layer
Library          RequestsLibrary

*** Keywords ***
Get User Token
      ${payload}    Create Dictionary
      ...    email=sac@smartbit.com
      ...    password=pwd123

    ${response}    POST    url=http://localhost:3333/sessions    json=${payload}
    ${token}    Set Variable    Bearer ${response.json()}[token]

    Set Suite Variable    ${token}

Get Account By Name
    [Arguments]    ${name}

    ${headers}    Create Dictionary    Authorization=${token}
    ${params}    Create Dictionary    name=${name}

    ${response}    GET    
    ...    url=http://localhost:3333/accounts
    ...    params=${params}
    ...    headers=${headers}
    
    RETURN    ${response.json()}[data][0]
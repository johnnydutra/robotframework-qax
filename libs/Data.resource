*** Settings ***
Documentation    Handlers for test data files
Library          JSONLibrary

*** Keywords ***
Get JSON Fixture
    [Arguments]    ${file_name}    ${node_path}
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json

    RETURN    ${data}[${node_path}]
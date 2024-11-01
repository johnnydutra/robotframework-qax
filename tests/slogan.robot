*** Settings ***
Documentation       Targeting SmartBit catchphrase slogan in the webapp
Resource            ../resources/base.resource
Library             Browser


*** Test Cases ***
Should display the catchphrase slogan in the landing page
    Start Session
    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!
    Take Screenshot
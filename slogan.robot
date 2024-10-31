*** Settings ***
Documentation    Targeting SmartBit catchphrase slogan in the webapp

Library    Browser

*** Test Cases ***
Should display the catchphrase slogan in the landing page
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5s
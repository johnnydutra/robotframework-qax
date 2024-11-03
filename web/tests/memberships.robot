*** Settings ***
Documentation    Enrollment scenarios
Resource         ../resources/Base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

# *** Variables ***
# &{NEW_MEMBER}     
# ...    name=Paulo Cintura    
# ...    email=paulo.cintura@test.com    
# ...    cpf=73592251082

# ${CREDIT_CARD}
# ...    number=4242424242424242
# ...    holder=${NEW_MEMBER}[name]
# ...    exp_month=12
# ...    exp_year=2030
# ...    cvv=123

*** Test Cases ***
Should Be Able To Complete New Membership
    &{data}    Get JSON Fixture    memberships    create

    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account    ${data}[account]

    Sign In With Admin User
    Enroll New Member    ${data}
    Toast Message Should Be    Matrícula cadastrada com sucesso.

Should Not Enroll Duplicated Membership
    &{data}    Get JSON Fixture    memberships    duplicate

    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account And Membership    ${data}

    Sign In With Admin User
    Enroll New Member    ${data}
    Toast Message Should Be    O usuário já possui matrícula.

Should Return Searched Membership By Name
    &{data}    Get JSON Fixture    memberships    search

    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account And Membership    ${data}

    Sign In With Admin User
    Go To Memberships Page
    Filter Membership By Name    ${data}[account][name]

Should Delete Membership
    &{data}    Get JSON Fixture    memberships    delete

    Database Delete Account By Email    ${data}[account][email]
    Database Insert User Account And Membership    ${data}

    Sign In With Admin User
    Go To Memberships Page
    Delete Membership By Name    ${data}[account][name]
    Confirm Removal
    Should Not Have Membership    ${data}[account][name]
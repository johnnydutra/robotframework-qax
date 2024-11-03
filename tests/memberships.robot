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

    ${data}    Get JSON Fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert User Account    &{data}[account]

    Sign In With Admin User
    Enroll New Member    ${data}
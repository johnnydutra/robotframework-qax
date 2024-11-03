*** Settings ***
Library    DatabaseLibrary

*** Keywords ***
Open Database Connection
    Connect To Database    
    ...    db_module=psycopg2    
    ...    db_name=smartbit    
    ...    db_user=postgres    
    ...    db_password=QAx@123    
    ...    db_host=localhost
    ...    db_port=5432

Database Delete Account By Email
    [Arguments]    ${email}
    Open Database Connection
    Execute Sql String    DELETE FROM accounts WHERE email = '${email}';
    Disconnect From Database

Database Insert User Account
    [Arguments]    ${account_data}
    ${name}     Set Variable    ${account_data}[name]
    ${email}    Set Variable    ${account_data}[email]
    ${cpf}      Set Variable    ${account_data}[cpf]
    Open Database Connection
    Execute Sql String    INSERT INTO accounts (name, email, cpf) VALUES ('${name}', '${email}', '${cpf}');
    Disconnect From Database

Database Insert User Account And Membership
    [Arguments]    ${data}
    ${name}       Set Variable    ${data}[account][name]
    ${email}      Set Variable    ${data}[account][email]
    ${cpf}        Set Variable    ${data}[account][cpf]
    ${plan_id}    Set Variable    ${data}[plan][id]
    ${price}      Set Variable    ${data}[plan][price]
    ${card}       Set Variable    ${data}[credit_card][last]

    Open Database Connection
    Execute Sql String    WITH new_account AS (INSERT INTO accounts (name, email, cpf) VALUES ('${name}', '${email}', '${cpf}') RETURNING id) INSERT INTO memberships (account_id, plan_id, credit_card, price, status) SELECT id, ${plan_id}, '${card}', ${price}, true FROM new_account;
    Disconnect From Database

Run SQL Script
    [Arguments]    ${file_name}
    Open Database Connection
    Execute Sql Script    ${EXECDIR}/sql/${file_name}.sql
    Disconnect From Database
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

Delete Account By Email
    [Arguments]    ${email}
    Open Database Connection
    Execute Sql String    DELETE FROM accounts WHERE email = '${email}';
    Disconnect From Database

Insert User Account
    [Arguments]    &{account_data}
    Open Database Connection
    Execute Sql String    INSERT INTO accounts (name, email, cpf) VALUES ('${account_data}[name]', '${account_data}[email]', '${account_data}[cpf]');
    Disconnect From Database
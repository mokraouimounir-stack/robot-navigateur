*** Settings ***
Library    Browser    timeout=30s

*** Variables ***
${URL}    https://www.saucedemo.com

*** Test Cases ***
Connexion reussie
    New Browser    chromium    headless=True
    New Page    ${URL}    wait_until=domcontentloaded
    Fill Text    id=user-name    standard_user
    Fill Text    id=password    secret_sauce
    Click    id=login-button
    Get Url    contains    inventory.html
    Get Text    css=.title    ==    Products
    Take Screenshot
    Close Browser

Connexion refusee avec un mauvais mot de passe
    New Browser    chromium    headless=True
    New Page    ${URL}    wait_until=domcontentloaded
    Fill Text    id=user-name    standard_user
    Fill Text    id=password    mauvais-mot-de-passe
    Click    id=login-button
    Get Text    css=[data-test="error"]    contains    do not match
    Take Screenshot
    Close Browser

Connexion refusee sans identifiant
    New Browser    chromium    headless=True
    New Page    ${URL}    wait_until=domcontentloaded
    Click    id=login-button
    Get Text    css=[data-test="error"]    contains    Username is required
    Take Screenshot
    Close Browser

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Iniciar testes
    Open Browser    https://google.com    ${BROWSER}
    ...    options=add_argument("--window-size=1920,1080")


Finalizar testes
    Close All Browsers
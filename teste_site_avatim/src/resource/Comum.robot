*** Settings ***
Library    SeleniumLibrary
Resource    ./po/PaginaInicial.robot

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Iniciar testes
    Open Browser    https://google.com    ${BROWSER}
    ...    options=add_argument("--window-size=1920,1080")
    Acessar O Site AVATIM


Finalizar testes
    Close All Browsers
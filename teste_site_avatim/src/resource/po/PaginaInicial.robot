*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://www.avatim.com.br/
${BARRA_DE_BUSCA}    class:search
${TITULO}    Avatim
${FECHAR_OVERLAY}    class:site-message-popup-content-close


*** Keywords ***
Acessar o site AVATIM
    Go To    ${URL}
    
Validar site AVATIM
    Wait Until Page Contains Element    ${BARRA_DE_BUSCA}
    Title Should Be    ${TITULO}
    Element Should Be Visible    ${BARRA_DE_BUSCA}

Tratar popup se existir
    Click Button    ${FECHAR_OVERLAY}


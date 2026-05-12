*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary
Library    SeleniumLibrary
Library    String

*** Variables ***
${BARRA_DE_BUSCA_TIPO}    css:input[type='search']
${JS_CLASSNAME}           class:search-form
${LUPA_PESQUISA}          data:action:show-form-search
${LINK_USUARIO}           class:link-account

*** Keywords ***
Barra de pesquisa
    [Arguments]    ${produto}
    Input Text    ${BARRA_DE_BUSCA_TIPO}    ${produto}
    Press Keys    ${BARRA_DE_BUSCA_TIPO}    RETURN

Limpar barra de pesquisa
    Clear Element Text    ${BARRA_DE_BUSCA_TIPO}

Clicar no icone de usuario
    Click Link    ${LINK_USUARIO}
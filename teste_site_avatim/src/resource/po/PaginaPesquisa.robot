*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary
Library    SeleniumLibrary
Library    String

*** Variables ***
${RESULTADO_DA_BUSCA_INVALIDA}  class:warning
${INFORMACAO_BUSCA}  BUSCA POR:
${LISTA_DE_PRODUTOS_INFORMADOS}  xpath://div[@class='content']/p[@class='subtitle']
@{QUANTIDADE_DE_ITENS}  css:figure[class='image -vertical']

*** Keywords ***
Validar pesquisa
    [Arguments]    ${produto}
    Wait Until Page Contains  ${INFORMACAO_BUSCA}
    Page Should Contain    ${produto}

    
Checar produto invalido
    Wait Until Page Contains  não foram encontrados produtos correspondentes à sua pesquisa


Comparar quantidades informada na pesquisa
    ${lista_de_itens}  Get Webelements  @{QUANTIDADE_DE_ITENS}
    ${quantidade_int}  Get Length    ${lista_de_itens}
    ${texto_quantidade_pgn}  Get Text    ${LISTA_DE_PRODUTOS_INFORMADOS}
    ${quantidade_informada_int}  Remove String Using Regexp  ${texto_quantidade_pgn}  \\D
    Should Be Equal As Integers    ${quantidade_int}  ${quantidade_informada_int}

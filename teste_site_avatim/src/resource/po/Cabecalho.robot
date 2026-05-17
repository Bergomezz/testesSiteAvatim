*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary
Library    SeleniumLibrary
Library    String

*** Variables ***
${BARRA_DE_BUSCA_TIPO}            css:input[type='search']
${JS_CLASSNAME}                   class:search-form
${LUPA_PESQUISA}                  data:action:show-form-search
${LINK_USUARIO}                   class:link-account
${LINK_SACOLA}                    class:btn-cart
${QUANTIDADE_PRODUTO_CARRINHO}    css:span[class='cart-drawer-text-xs cart-drawer-text-gray-400']
${TEXTO_SACOLA}                   css:p[class='cart-drawer-text-xs']
${FECHAR_SACOLA}                  class:cart-drawer-focusable  #css:button[class='cart-drawer-focusable cart-drawer-flex cart-drawer-p-2 cart-drawer-rounded-md hover:cart-drawer-bg-gray-400 hover:cart-drawer-bg-opacity-25 cart-drawer-transition cart-drawer-duration-150']

*** Keywords ***
Barra de pesquisa
    [Arguments]    ${produto}
    Input Text    ${BARRA_DE_BUSCA_TIPO}    ${produto}
    Press Keys    ${BARRA_DE_BUSCA_TIPO}    RETURN

Limpar barra de pesquisa
    Clear Element Text    ${BARRA_DE_BUSCA_TIPO}

Clicar no icone de usuario
    Click Link    ${LINK_USUARIO}
    
Clicar no icone da sacola
    Click Button    ${LINK_SACOLA}

Verificar se a sacola esta vazia
    Wait Until Page Contains    Carrinho de compras
    ${quantidade_informada_carrinho}  Get Text    ${QUANTIDADE_PRODUTO_CARRINHO}
    ${int_quantidade_carrinho}  Remove String Using Regexp  ${quantidade_informada_carrinho}  \\D
    #Log To Console    Quantidade na sacola é:  ${int_quantidade_carrinho}
    Should Be Equal As Integers   ${int_quantidade_carrinho}    0
    Element Text Should Be    ${TEXTO_SACOLA}  Seu carrinho está vazio
    Wait Until Element Is Visible    ${FECHAR_SACOLA}
    Click Button    ${FECHAR_SACOLA}
    
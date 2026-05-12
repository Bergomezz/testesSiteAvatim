*** Settings ***
Resource    ./po/PaginaInicial.robot
Resource    ./po/PaginaPesquisa.robot
Resource    ./po/Cabecalho.robot



*** Variables ***


*** Keywords ***
Acessar pagina inicial da AVATIM
    Acessar O Site AVATIM


Validar se a página foi carregada
    Validar Site AVATIM

Digitar na barra de pesquisa
    [Arguments]    @{lista_de_produtos}
    FOR    ${produto}  IN  @{lista_de_produtos}
        Barra De Pesquisa    ${produto}
        Validar Pesquisa    ${produto}
        Comparar Quantidades Informada Na Pesquisa
        Limpar Barra De Pesquisa
    END
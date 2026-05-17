*** Settings ***
Resource    ./po/Cabecalho.robot
Resource    ./po/MenuPaginaInicial.robot
Resource    ./po/PaginaInicial.robot
Resource    ./po/PaginaLoginUser.robot
Resource    ./po/PaginaPesquisa.robot


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


Acessar pagina de login do usuario
    Clicar No Icone De Usuario
    Validar Pagina Do Usuario


Confirmar se a sacola esta vazia
    Clicar No Icone Da Sacola
    Verificar se a sacola esta vazia


Checar quantidades de links da barra de menu inicial
    Quantidade de links deve ser igual a:    11



Cadastrar com email valido
    Cadastrar Com E-mail

Cadastrar com telefone valido
    Cadastrar com telefone
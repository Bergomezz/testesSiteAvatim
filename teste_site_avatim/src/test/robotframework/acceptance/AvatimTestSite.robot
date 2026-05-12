*** Settings ***
Resource    ../../../resource/Comum.robot
Resource    ../../../resource/AvatimAppSite.robot
Test Setup    Iniciar Testes
Test Teardown    Finalizar Testes

*** Variables ***
@{LISTA_DE_PRODUTOS}    serena intense  iris rose  bakari
@{PESQUISA_INVALIDA}    gato  cachorro  passaro  prato

*** Test Cases ***
TC0001 - Validar acesso ao E-commerce do Site AVATIM
    [Tags]    Critico    Smoke Test
    [Documentation]    Acessar ao servidor do site da Avatim e obter sucesso
    Acessar Pagina Inicial Da AVATIM
    Validar Se A Página Foi Carregada


TC0002 - Validar barra de pesquisa com produtos em estoque
    [Tags]    Medio    Funcionalidade
    [Documentation]    Efetuar uma pesquisa com produtos válidos em estoque na loja
    Acessar Pagina Inicial Da AVATIM
    Digitar Na Barra De Pesquisa    @{LISTA_DE_PRODUTOS}

TC0003 - Usar barra de pesquias com produtos inválidos
    [Tags]    Medio    Funcionalidade
    [Documentation]    Efetuar uma pesquisa com produtos que não são vendidos
    Acessar Pagina Inicial Da AVATIM
    Digitar Na Barra De Pesquisa    @{PESQUISA_INVALIDA}
    Checar Produto Invalido
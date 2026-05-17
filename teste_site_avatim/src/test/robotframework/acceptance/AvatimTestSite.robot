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
    [Tags]    TC0001    Critico    Smoke Test
    [Documentation]    Acessar ao servidor do site da Avatim e obter sucesso
    Validar Se A Página Foi Carregada


TC0002 - Validar barra de pesquisa com produtos em estoque
    [Tags]    TC0002    Medio    Funcionalidade
    [Documentation]    Efetuar uma pesquisa com produtos válidos em estoque na loja
    Digitar Na Barra De Pesquisa    @{LISTA_DE_PRODUTOS}

TC0003 - Usar barra de pesquias com produtos inválidos
    [Tags]    TC0003    Medio      Funcionalidade
    [Documentation]    Efetuar uma pesquisa com produtos que não são vendidos
    Digitar Na Barra De Pesquisa    @{PESQUISA_INVALIDA}
    Checar Produto Invalido


TC0004 - Accesar a área de usuario (login e cadastro)
    [Tags]    TC0004    Alto    Funcionalidade
    [Documentation]    Acessar a página de login e cadastro de novos usuários
    Acessar Pagina De Login Do Usuario


TC0005 - Clicar e verificar se a sacola eta vazia
    [Tags]    TC0005    Alto    Funcionalidade
    [Documentation]    Acessar a sacola e confirmar se a mesma se encontra sem produtos
    Confirmar Se A Sacola Esta Vazia
    
    
TC0006 – Checar a quantidade correta de links da barra de menu com as categorias existentes
    [Tags]    TC0006    Normal    Smoke
    [Documentation]    Confirmar se todos os links estão disponíveis para o usuário
    Checar Quantidades De Links Da Barra De Menu Inicial
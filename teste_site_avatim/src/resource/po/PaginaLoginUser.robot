*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary  locale=pt_BR
Library    SeleniumLibrary
Library    String

*** Variables ***
${TITULO_PAG_USER}  Entrar - Avatim Cheiros da Terra
${FRASE_PAG_USER}  Conecte-se aqui
${CAIXA_DE_TEXTO}  name:identifier


*** Keywords ***
Validar pagina do usuario
    Title Should Be  ${TITULO_PAG_USER}
    Page Should Contain  ${FRASE_PAG_USER}


Cadastrar com e-mail
    ${faker_email}  FakerLibrary.Email
    Input Text    ${CAIXA_DE_TEXTO}  ${faker_email}
    
Cadastrar com telefone
    ${faker_telefone}  FakerLibrary.Phone Number
    Input Text  ${CAIXA_DE_TEXTO}  ${faker_telefone}

Cadastrar com CPF
    ${faker_cpf}  FakerLibrary.Random Int  max - 4
    Input Text  ${faker_cpf}
    Sleep    10s

Efetuar o login

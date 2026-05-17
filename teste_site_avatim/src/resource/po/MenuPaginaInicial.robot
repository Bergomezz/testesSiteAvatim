*** Settings ***
Library    BuiltIn
Library    Collections
Library    FakerLibrary
Library    SeleniumLibrary
Library    String

*** Variables ***
${LISTA_MENU}    class:menu-list
${LISTA_SUBMENU_SEM_SUB}  //li[@class='menu-item']
${LISTA_SUBMENU_COM_SUB}  //li[@class='menu-item has-submenu']


*** Keywords ***
Quantidade de links deve ser igual a:
    [Arguments]    ${quantidade_comparativa}
    Wait Until Element Is Enabled  ${LISTA_MENU}
    ${quat_sem_sub}  Get Element Count  ${LISTA_SUBMENU_SEM_SUB}
    ${quat_com_sub}  Get Element Count  ${LISTA_SUBMENU_COM_SUB}
    ${qut_total}  Evaluate    ${quat_sem_sub} + ${quat_com_sub}
    Should Be Equal As Integers   ${qut_total}  ${quantidade_comparativa}
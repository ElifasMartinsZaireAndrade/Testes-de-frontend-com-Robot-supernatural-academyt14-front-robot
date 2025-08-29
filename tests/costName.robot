*** Settings ***
Library              SeleniumLibrary
Library              Dialogs
Resource             ../resource/costName.resource
Resource             ../resource/config.resource
Test Setup           Abrir Navegador e Fazer Login
Test Teardown        Close All Browsers

*** Test Cases ***
CT01: Realizar novo cadastro centro de custo
    [Documentation]    Teste para realizar um novo cadastro no centro de custos.
    Selecionar cadastros
    Acessar o centro de custos
    Clicar no botão para novo cadastro
    Adiconar nome do centro de custo e salvar
    
CT02: Editar centro de custo
    [Documentation]    Teste para editar um centro de custo.
    ${nome_aleatorio}=    Generate Random String    10    [LOWER]
    Selecionar cadastros
    Acessar o centro de custos
    Editar Centro de Custo pela Posicao    1    ${nome_aleatorio}
    
CT03: Editar centro de custo em braco
    [Documentation]    Teste para editar um centro de custo em branco.
    Selecionar cadastros
    Acessar o centro de custos
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View         xpath=/html/body/div/div/div[2]/div[2]/div
    Editar Centro de Custo pela Posicao    1    ${EMPTY}
    Wait Until Element Contains    xpath=//p[text()='O campo diretoria é obrigatório']    O campo diretoria é obrigatório
*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../resource/costName.resource
Resource        ../resource/config.resource
Test Setup       Abrir Navegador e fazer login
Test Teardown    Close All Browsers


*** Test Cases ***

Realizar novo cadastro centro de custo 
    [Documentation]   Teste para realizar um novo cadastro no centro de custos.
    Pause Execution 
    Selecionar cadastros
    Acessar o centro de custos
    Clicar no botão para novo cadastro
    Adiconar nome do centro de custo e salvar

Editar centro de custo
    [Documentation]   Teste para editar um centro de custo.
    Pause Execution 
    Selecionar cadastros
    Acessar o centro de custos
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View         xpath=/html/body/div/div/div[2]/div[2]/div
    Selecionar centro de custo 
    Wait Until Element Is Visible    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[5]  
  
Editar centro de custo com erro
    [Documentation]   Teste para editar um centro de custo com erro.
    Pause Execution 
    Selecionar cadastros
    Acessar o centro de custos
    Wait Until Element Is Visible    xpath=/html/body/div/div/div[2]/div[2]/div
    Scroll Element Into View         xpath=/html/body/div/div/div[2]/div[2]/div
    Editar Centro de Custo pela Posicao    2    ${EMPTY}
    Wait Until Element Contains    xpath=//p[text()='O campo diretoria é obrigatório']    O campo diretoria é obrigatório    
    #Wait Until Page Contains Element    xpath=//div[contains(@class,'MuiAlert-message') and text()="O campo 'centro de custos' só pode conter letras e o caractere especial '&'."]    15s
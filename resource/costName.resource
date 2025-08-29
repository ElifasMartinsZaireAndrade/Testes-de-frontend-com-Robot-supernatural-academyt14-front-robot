*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../resource/config.resource


*** Keywords ***
Selecionar cadastros
     [Documentation]   Clica no botão para abrir o centro de custos.
     Wait Until Element Is Visible    xpath=//*[@id="Cadastros"] 
     Click Element     xpath=//*[@id="Cadastros"]
Acessar o centro de custos
    [Documentation]     Acessa a página de centro de custos.
    Wait Until Element Is Visible    xpath=//*[@id="Centro de Custo"]    10s
    Click Element     xpath=//*[@id="Centro de Custo"]
    
Clicar no botão para novo cadastro
    [Documentation]   Clica no botão para criar um novo cadastro.
    Wait Until Element Is Visible    xpath=//*[@id="Novo Cadastro"]
    Click Element    xpath=//*[@id="Novo Cadastro"]
    
Adiconar nome do centro de custo e salvar
    [Documentation]   Adiciona o nome do centro de custo no campo apropriado.
    ${nome_centro} =    Generate Random String    10    [UPPER]
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"] 
    Input Text    xpath=//*[@id="costCentername"]    ${nome_centro}
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Button     id=save

Selecionar centro de custo
    [Documentation]   Edita o centro de custo existente.
    Wait Until Element Is Visible    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']  
    Click Element    xpath=//p[text()='Marketing']/following-sibling::div/button[text()='Editar']

Adicionar nome na edição do centro de custo
    [Documentation]   Adiciona o nome do centro de custo no campo apropriado.
    Wait Until Element Is Visible    xpath=//*[@id="costCentername"] 
    Input Text    xpath=//*[@id="costCentername"]    E*&
    Click Element    xpath=//*[@id="Diretoria"]
    Click Element    xpath=//*[@id="Diretoria"]/option[2]
    Click Button     id=save
    
Editar Centro de Custo pela Posicao
    [Arguments]    ${posicao_item}    ${novo_nome}    
    [Documentation]    Edita um centro de custo pela sua posicao.
    
    # Clica no botão 'Editar' na posicao exata que você quer
    Wait Until Element Is Visible    xpath=(//button[text()='Editar'])[${posicao_item}] 
    Click Element    xpath=(//button[text()='Editar'])[${posicao_item}]

    # Preenche o campo de nome com o valor que você passar
    Wait Until Element Is Visible    id=costCentername
    Input Text    id=costCentername    ${novo_nome}

    # Clica na diretoria e seleciona a opcao fixa na posicao 2
    Click Element    id=Diretoria
    Click Element    xpath=//*[@id="Diretoria"]/option[2]

    # Clica no botao 'Salvar'
    Click Button    id=save
    
    RETURN    ${novo_nome}

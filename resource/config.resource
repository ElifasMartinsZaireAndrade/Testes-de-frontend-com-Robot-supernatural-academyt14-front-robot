*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${url}        https://shogun.qacoders.dev.br/login
${browser}    chrome
${email}      sysadmin@qacoders.com
${senha}      1234@Test

*** Keywords ***
Abrir Navegador
    [Documentation]    Abre o navegador num estado limpo (anónimo) para evitar pop-ups.
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys, selenium.webdriver

    # Adiciona argumentos para forçar um ambiente de teste limpo
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-extensions

    # Lógica para rodar em modo Headless (no GitHub Actions, por exemplo)
    ${headless_mode}=    Get Variable Value    ${HEADLESS}    default=${EMPTY}
    Run Keyword If    '${headless_mode}' != '${EMPTY}'
    ...    Adicionar Opções Headless    ${options}

    # Remove a barra amarela "Chrome está sendo controlado..."
    ${switches}=    Create List    enable-automation
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${switches}

    Open Browser    ${url}    chrome    options=${options}
    Maximize Browser Window

Adicionar Opções Headless
    [Arguments]    ${options_obj}
    Log    Executando em modo Headless
    #Call Method    ${options_obj}    add_argument    --headless
    Call Method    ${options_obj}    add_argument    --no-sandbox
    Call Method    ${options_obj}    add_argument    --disable-dev-shm-usage

Fazer Login
    [Documentation]    Preenche os campos de login e clica no botão.
    Wait Until Element Is Visible    id=email
    Input Text    id=email    ${email}
    Input Text    id=password    ${senha}
    Click Button    id=login

Abrir Navegador e Fazer Login
    [Documentation]    Abre o navegador e realiza o login.
    Abrir Navegador
    Fazer Login
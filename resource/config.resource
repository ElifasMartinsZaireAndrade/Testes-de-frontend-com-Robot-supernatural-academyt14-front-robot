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
    [Documentation]    Abre o navegador com as opções corretas.
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    modules=sys,selenium.webdriver.chrome.options
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    Open Browser    ${url}    chrome    options=${options}
    Maximize Browser Window
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
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${url}        https://shogun.qacoders.dev.br/login
${browser}    chrome
${email}      sysadmin@qacoders.com
${senha}      1234@Test

*** Keywords ***
Abrir Navegador e fazer login
    [Documentation]    Abre o navegador na URL e maximiza a janela.
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    modules=sys,selenium.webdriver.chrome.options
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    Open Browser        ${url}    ${browser}   options=add_argument("--no-sandbox")
    Maximize Browser Window
    Input Text          id=email    ${email}
    Input Text          id=password    ${senha}
    Click Button        id=login
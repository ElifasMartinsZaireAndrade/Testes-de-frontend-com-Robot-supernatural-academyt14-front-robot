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
    Open Browser        ${url}    ${browser}
    Maximize Browser Window
    Input Text          id=email    ${email}
    Input Text          id=password    ${senha}
    Click Button        id=login
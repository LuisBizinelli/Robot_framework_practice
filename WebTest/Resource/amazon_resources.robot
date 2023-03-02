*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${URL}                        https://www.amazon.com.br/
${MENU_ELETRONICOS}           //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}         //h1[contains(.,'Eletrônicos e Tecnologia')]
${CATEGORIA_INFORMATICA}      //img[contains(@alt,'Computadores e Informática')]
${CAMPO_PESQUISAR}            //input[contains(@type,'text')]
${BOTAO_PESQUISAR}            //input[contains(@type,'submit')]
${RESULTADO_CONSOLE}          //h2[@class='a-size-mini a-spacing-none a-color-base s-line-clamp-4'][contains(.,'Console PlayStation 5')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}


Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}" 
    Title Should Be    ${TITULO}

Verificar se aparece a categoria "Computadores e Informática"
    Page Should Contain Image    ${CATEGORIA_INFORMATICA}

Digitar o nome de produto "${TEXTO_PESQUISA}" no campo de pesquisa
    Input Text    ${CAMPO_PESQUISAR}    ${TEXTO_PESQUISA}

Clicar no botão de pesquisa
    Click Button    ${BOTAO_PESQUISAR}

Verificar o resultado da pesquisa se esta listando o produto pesquisado
    Wait Until Element Is Visible    ${RESULTADO_CONSOLE}
    

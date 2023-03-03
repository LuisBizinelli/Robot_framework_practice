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
${PRODUTO_SELECIONADO}        //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console PlayStation 5')]
${ADICONAR_CARRINHO}          //input[contains(@name,'submit.add-to-cart')]
${CONFIRMACAOO_ADICAO}         //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${BOTAO_REMOVER}              //input[contains(@title,'Excluir')]
${CONFIRMACAO_REMOCAO}        //div[contains(@class,'a-section ewc-item-remove-msg')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
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


Adicionar o produto "playstation 5" no carrinho
    Wait Until Element Is Visible    ${PRODUTO_SELECIONADO}
    Click Element                    ${PRODUTO_SELECIONADO}
    Click Element                    ${ADICONAR_CARRINHO}

Verificar se o produto "playstation 5" foi adicionado com sucesso
    Wait Until Element Is Visible    ${CONFIRMACAOO_ADICAO}


Remover o produto "playstation 5" do carrinho
    Click Element    ${BOTAO_REMOVER}

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    ${CONFIRMACAO_REMOCAO}

#BDD Steps

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "${TITULO}" deve ser exibido na página
    Verificar se o título da página fica "${TITULO}" 

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "${TEXTO_PESQUISA}"
    Digitar o nome de produto "${TEXTO_PESQUISA}" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "${TITULO}"
    Title Should Be    ${TITULO}
E um produto da linha "playstation 5" deve ser mostrado na página"
    Verificar o resultado da pesquisa se esta listando o produto pesquisado

Quando adicionar o produto "${TEXTO_PESQUISA}" no carrinho
  Digitar o nome de produto "${TEXTO_PESQUISA}" no campo de pesquisa
  Clicar no botão de pesquisa
  Adicionar o produto "playstation 5" no carrinho

Então o produto "PlayStation 5" deve ser mostrado no carrinho
  Verificar se o produto "playstation 5" foi adicionado com sucesso

E existe o produto "${TEXTO_PESQUISA}" no carrinho
  Digitar o nome de produto "${TEXTO_PESQUISA}" no campo de pesquisa
  Clicar no botão de pesquisa
  Adicionar o produto "playstation 5" no carrinho
  Verificar se o produto "playstation 5" foi adicionado com sucesso

Quando remover o produto "PlayStation 5" do carrinho
  Sleep    2
  Remover o produto "playstation 5" do carrinho

Então o carrinho deve ficar vazio
  Verificar se o carrinho fica vazio
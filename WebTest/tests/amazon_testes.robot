*** Settings ***
  [Documentation]    Essa suite testa o site amazon.com.br
Resource             ../Resource/amazon_resources.robot
Test Setup           Abrir o navegador  
Test Teardown        Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletronicos do site amazon.com.br
    ...                E se aparece sua categoria computadores e Informática
    [Tags]    Menus  Categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"    
    Verificar se aparece a categoria "Computadores e Informática"


Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca do produto Xbox Series X
    [Tags]    Busca_Produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado



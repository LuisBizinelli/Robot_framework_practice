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
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca do produto Xbox Series X
    [Tags]    Busca_Produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "playstation 5"
    Então o título da página deve ficar "Amazon.com.br : playstation 50"
    E um produto da linha "PlayStation 5" deve ser mostrado na página"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "PlayStation 5" no carrinho
    Então o produto "PlayStation 5" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "PlayStation 5" no carrinho
    Quando remover o produto "PlayStation 5" do carrinho
    Então o carrinho deve ficar vazio

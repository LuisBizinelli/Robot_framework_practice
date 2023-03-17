*** Settings ***
Documentation    Esse arquivo contem a resolução da tarefa

*** Variables ***
#   INDEX   0  1  2  3  4  5  6  7  8  9
@{LISTA}    1  2  3  4  5  6  7  8  9  10
                
*** Test Cases ***
Cenário 01 - Usando Loops e condicionais
    Percorrer uma lista e logar apenas os numeros "5" e "10"


*** Keywords ***
Percorrer uma lista e logar apenas os numeros "${num1}" e "${num2}"
    Log To Console    \n Lista de números:
    FOR   ${num}   IN   @{LISTA}
        IF  ${num} == ${num1}
          Log To Console    Eu sou o numero ${num1}
        ELSE IF  ${num} == ${num2}
          Log To Console    Eu sou o numero ${num2}
        ELSE
          Log To Console    Eu não sou o numero ${num1} nem o numero ${num2}
        END
    END
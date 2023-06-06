Algoritmo "Projeto Locação de Kart"
// Disciplina : [Conceitos de Algorítmos]
// Professor : Gilberto
// Nome da 'empresa/grupo de desenvolvimento' : GRUPO AVANT-GARD
// Integrantes do grupo: Jullia, Andreia, Maria Clara, Adriano, Pedro

Var
   //funções
   //vetores e matrizes
   vet_modelo:vetor[0..14] de caracter
   vet_valor:vetor[0..14] de real
   vet_locacao:vetor[0..14] de logico
   //inteiro
   menu: inteiro
   m: inteiro
   res: inteiro
   //real
   var_valor: real
   //caracter
   rodada: caracter
   sair: caracter
   var_modelo: caracter
   sair_cadastro: caracter

funcao cadastrar_kart: inteiro
var
inicio
     enquanto (sair_cadastro <> "N") faca
      escreval("DIGITE O MODELO DO KART PARA O  CADASTRO:")
      leia(var_modelo)
       vet_modelo[m] <- var_modelo
      escreval("DIGITE O VALOR DO KART PARA O  CADASTRO:")
      leia(var_valor)
       vet_valor[m] <- var_valor
       m <- m+1
      escreval("DESEJA CADASTRAR OUTRO VEICULO? S/N")
      leia(sair_cadastro)
       sair_cadastro <- Maiusc(sair_cadastro)
   retorne cadastrar_kart
   fimenquanto
fimfuncao

funcao listar_karts: inteiro
var
inicio

      para m de 0 ate 14 passo 1 faca
         se((vet_modelo[m] <> "") e (vet_valor[m] <> 0))entao
            escreval("MODELO: ",vet_modelo[m])
            escreval("VALOR: R$ ",vet_valor[m]," ,00")
          fimse
      fimpara
      se(vet_modelo[m] = "")entao
        escreval("NÃO HÁ KARTS DISPONÍVEIS OU CADASTRADOS")
      fimse
      retorne listar_karts
fimfuncao
funcao listar_locados: inteiro
var aux: inteiro
inicio

   se (vet_modelo[m] = "") entao
      escreva("não há nenhum Kart Locado")
   senao
fimfuncao
Inicio
   rodada <- "S"
   enquanto (rodada = "S") faca
      escreval("BEM-VINDO AO GERENCIAMENTO DE LOCAÇÃO DE KARTS!!")
      escreval("DIGITE UM NÚMERO PARA SELECIONAR A OPÇÃO DESEJADA")
      escreval

      repita
         escreval("1. CADASTRAR UM KART")
         escreval("2. LISTAR KARTS DISPONÍVEIS")
         escreval("3. LISTAR KARTS LOCADOS")
         escreval("4. ALUGAR UM KART")
         escreval("5. DEVOLVER UM KART")
         escreval("6. KART QUE MAIS GEROU GANHOS")
         escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
         escreval("8. LOCAÇÃO DE CIRCUITO")
         escreval("9. ATUALIZAR DIA")
         escreval("10. SAIR DO PROGRAMA")
         escreval
         escreva("Digite aqui: ")
         leia(menu)

         escolha(menu)
         caso 1
            escreval("1. CADASTRAR UM KART")

            escreval(cadastrar_kart)

         caso 2
            escreval("2. LISTAR KARTS DISPONÍVEIS")

            escreval(listar_karts)
         caso 3
            escreval("3. LISTAR KARTS LOCADOS")

         caso 4
            escreval("4. ALUGAR UM KART")
            escreval
            escreval("QUAL KART DESEJA ALUGAR?")

            leia(vet_modelo)
            vet_locacao <- vet_modelo
         caso 5
            escreval("5. DEVOLVER UM KART")
         caso 6
            escreval("6. KART QUE MAIS GEROU GANHOS")
         caso 7
            escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
         caso 8
            escreval("8. LOCAÇÃO DE CIRCUITO")
         caso 9
            escreval("9. ATUALIZAR DIA")

         fimescolha
      ate((menu >= 1) e (menu <= 10))


      se(menu = 10) entao
         repita
            escreval("Tem certeza que deseja sair? S/N")
            leia(sair)
            sair <- Maiusc(sair)
            se(sair = "S")entao
               escreval("OBRIGADO PELA PREFERÊNCIA, VOLTE SEMPRE!!")
               rodada <- "N"
            fimse
         ate((sair = "S") ou (sair = "N"))
      fimse



      se(menu <> 10)entao
         repita
            escreval("DESEJA VOLTAR AO MENU INICIAL? S/N ?")
            leia(rodada)
            rodada <- Maiusc(rodada)
            se (rodada = "N") então
               escreval
               escreval("OBRIGADO PELA PREFERÊNCIA, VOLTE SEMPRE!!")
            fimse
         ate ((rodada = "S") ou (rodada = "N"))
      fimse


   fimenquanto





Fimalgoritmo
Algoritmo "Projeto LocaÁ„o de Kart"
// Disciplina : [Conceitos de Algor√≠tmos]
// Professor : Gilberto
// Nome da 'empresa/grupo de desenvolvimento' : GRUPO AVANT-GARD
// Integrantes do grupo: Jullia, Andreia, Maria Clara, Adriano, Pedro

Var

   //vetores e matrizes
   vet_modelo:vetor[0..14] de caracter
   vet_valor:vetor[0..14] de real
   vet_locados:vetor[0..14] de caracter
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

funcao cadastrar_kart: caracter
var aux: caracter
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
   fimenquanto
   retorne aux
fimfuncao

funcao listar_karts: caracter
var aux: caracter
ver_vazio: inteiro
inicio
   para m de 0 ate 14 faca
      se(vet_modelo[m] <> "")entao
         ver_vazio <- 1
      fimse
   fimpara
   
   se (ver_vazio = 1) ent„o
      para m de 0 ate 14 passo 1 faca
         se((vet_modelo[m] <> "") e (vet_valor[m] <> 0))entao
            escreval("MODELO: ",vet_modelo[m])
            escreval("VALOR: R$ ",vet_valor[m]," ,00")
         fimse
      fimpara
   senao
      escreval("N√O H¡Å KARTS DISPONÕVEIS OU CADASTRADOS")
   fimse
   retorne aux
fimfuncao

procedimento listar_locados()
var
inicio
   escreval("OS KARTS LOCADOS S√O: ")
   para m de 0 ate 14 faca
      se (vet_locados[m] <> "") ent„o
      escreval(vet_locados[m])
      fimse
   fimpara
fimprocedimento

funcao alugar_kart: caracter
var posicao: inteiro
aux, sair_aluga: caracter
inicio
   escreval("KARTS DISPONIVEIS:")
   escreval(listar_karts)
   sair_aluga <- "S"
   repita
   escreva("DIGITE O N⁄MERO DO KART QUE VOC  DESEJA: ")
   leia(posicao)

   vet_locados[posicao] <- vet_modelo[posicao]

   escreval("DESEJA ALUGAR MAIS UM? S/N")
   leia(sair_aluga)
   sair_aluga <- Maiusc(sair_aluga)
   se (sair_aluga = "N") ent„o
      sair_aluga <- "N"
   fimse
   atÈ (sair_aluga = "N")

   retorne aux
fimfuncao

Inicio
   rodada <- "S"
   enquanto (rodada = "S") faca
      escreval("BEM-VINDO AO GERENCIAMENTO DE LOCA«√O DE KARTS!!")
      escreval("DIGITE UM N⁄MERO PARA SELECIONAR A OP«√OO DESEJADA")
      escreval

      repita
         escreval("1. CADASTRAR UM KART")
         escreval("2. LISTAR KARTS DISPON√çVEIS")
         escreval("3. LISTAR KARTS LOCADOS")
         escreval("4. ALUGAR UM KART")
         escreval("5. DEVOLVER UM KART")
         escreval("6. KART QUE MAIS GEROU GANHOS")
         escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
         escreval("8. LOCA√á√ÉO DE CIRCUITO")
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
            escreval("2. LISTAR KARTS DISPONÕVEIS")

            escreval(listar_karts)
         caso 3
            escreval("3. LISTAR KARTS LOCADOS")

            listar_locados()
            
         caso 4
            escreval("4. ALUGAR UM KART")
            escreval(alugar_kart)
            
         caso 5
            escreval("5. DEVOLVER UM KART")
         caso 6
            escreval("6. KART QUE MAIS GEROU GANHOS")
         caso 7
            escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
         caso 8
            escreval("8. LOCA«√O DE CIRCUITO")
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
               escreval("OBRIGADO PELA PREFER√äNCIA, VOLTE SEMPRE!!")
               rodada <- "N"
            fimse
         ate((sair = "S") ou (sair = "N"))
      fimse



      se(menu <> 10)entao
         repita
            escreval("DESEJA VOLTAR AO MENU INICIAL? S/N ?")
            leia(rodada)
            rodada <- Maiusc(rodada)
            se (rodada = "N") entao
               escreval
               escreval("OBRIGADO PELA PREFER√äNCIA, VOLTE SEMPRE!!")
            fimse
         ate ((rodada = "S") ou (rodada = "N"))
      fimse


   fimenquanto





Fimalgoritmo

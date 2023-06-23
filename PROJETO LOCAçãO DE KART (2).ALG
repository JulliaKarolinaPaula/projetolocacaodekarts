Algoritmo "Projeto LocaÁ„o de Kart"
// Disciplina : [Conceitos de AlgorÌtmos]
// Professor : Gilberto
// Nome da 'empresa/grupo de desenvolvimento' : GRUPO AVANT-GARD
// Integrantes do grupo: Jullia, Andreia, Maria Clara, Adriano, Pedro

Var

   //vetores e matrizes
   vet_modelo:vetor[0..14] de caracter
   vet_valor:vetor[0..14] de real
   vet_locados:vetor[0..14] de caracter
   vet_valorlocados:vetor [0..14] de real
   vet_maioralu: vetor[0..14] de inteiro
   //inteiro
   menu: inteiro
   m: inteiro
   res: inteiro
   opcao: inteiro
   qtd_alu: inteiro
   atualizacao_valor: inteiro
   //real
   var_valor: real
   maior_valor: real
   valor_circuito: real
   //caracter
   rodada: caracter
   sair: caracter
   var_modelo: caracter
   sair_cadastro: caracter
   maior_kart: inteiro
   circuito: caracter
   maior_alu: caracter


funcao cadastrar_kart: caracter
var aux: caracter
inicio
   sair_cadastro <- "S"


    enquanto (sair_cadastro = "S") faca
     repita
      escreval("DIGITE O MODELO DO KART PARA O  CADASTRO:")
      leia(var_modelo)
     ate(var_modelo <> "")
      vet_modelo[m] <- var_modelo
      repita
      escreval("DIGITE O VALOR DO KART PARA O  CADASTRO:")
      leia(var_valor)
      ate(var_valor <> 0)

      vet_valor[m] <- var_valor
      m <- m+1
      se(vet_modelo[14] <> "") e (vet_valor[14] <> 0)entao
         escreval("NUMERO M¡XIMO DE CADASTROS ATINGIDOS.")
            sair_cadastro <- "N"
      senao
      escreval("DESEJA CADASTRAR OUTRO VEICULO? S/N")
      leia(sair_cadastro)
      sair_cadastro <- Maiusc(sair_cadastro)
      fimse
   fimenquanto
   retorne aux
fimfuncao

funcao listar_karts: caracter
var aux: caracter
   ver_vazio, i: inteiro
inicio
   para i de 0 ate 14 faca
      se(vet_modelo[i] <> "")entao
         ver_vazio <- 1
      fimse
   fimpara

   se (ver_vazio = 1) ent„o
      para i de 0 ate 14 passo 1 faca
         se((vet_modelo[i] <> "") e (vet_valor[i] <> 0))entao
            escreval(i,". ",vet_modelo[i]," | ","VALOR: R$ ",vet_valor[i]," ,00")
         fimse
      fimpara
   senao
      escreval("NAO HAÅ KARTS DISPONIVEIS OU CADASTRADOS")
   fimse

   retorne aux
fimfuncao

funcao listar_locados: caracter
var vazio, i: inteiro
   aux: caracter
inicio
   para i de 0 ate 14 faca
      se (vet_locados[i] <> "") entao
         vazio <- 1
      fimse
   fimpara
   se(vazio = 1)entao
      escreval("OS KARTS LOCADOS SAO: ")
      para i de 0 ate 14 passo 1 faca
         se(vet_locados[i] <> "")entao
            escreval(i,": ", vet_locados[i])
         fimse
      fimpara
   senao
      escreval("NAO HAÅKARTS LOCADOS NO MOMENTO.")
   fimse

   retorne aux
fimfuncao

funcao alugar_kart: caracter
var posicao, vazio, i: inteiro
   aux, sair_aluga: caracter
inicio
   repita
      vazio <- 0
      para i de 0 ate 14 passo 1 faca
         se(vet_modelo[i] <> "")entao
            vazio <- 1
         fimse
      fimpara

      se(vazio = 1) entao
         escreval("KARTS DISPONIVEIS:")
         escreval(listar_karts)
         sair_aluga <- "S"
         repita
         escreva("DIGITE O NUMERO DO KART QUE VOCE DESEJA: ")
         leia(posicao)
         ate((posicao >= 0) OU (posicao <=14))

         vet_locados[posicao] <- vet_modelo[posicao]
         vet_valorlocados[posicao] <- vet_valor[posicao]

         vet_maioralu[posicao] <- vet_maioralu[posicao] + 1

         vet_modelo[posicao] <- ""
         vet_valor[posicao] <- 0

          se(vet_locados[posicao] = vet_maioralu[posicao]) entao
             maior_alu <- vet_locados[posicao]
          fimse
          se(vet_maioralu[posicao] > qtd_alu) entao
             qtd_alu <- vet_maioralu[posicao]
          fimse

         escreval("ALUGAR OUTRO KART DISPONIVEL? S/N")
         leia(sair_aluga)
         sair_aluga <- Maiusc(sair_aluga)
         se (sair_aluga = "N") ent„o
            sair_aluga <- "N"
         fimse
      senao
         escreval("NAO HA KARTS DISPONIVEIS OU CADASTRADOS.")
         sair_aluga <- "N"
      fimse
   ate (sair_aluga = "N")
   retorne aux

fimfuncao

funcao devolver_kart: caracter
var  posicao,vazio, i: inteiro
   aux, sair_devol: caracter
inicio
   repita
      vazio <- 0
      para i de 0 ate 14 passo 1 faca
         se(vet_locados[i] <> "")entao
            vazio <- 1
         fimse
      fimpara

      se(vazio = 1)entao
         escreval("DESEJA DEVOLVER QUAL KART LOCADO?")
         escreval(listar_locados)
         repita
         escreva("DIGITE O NUMERO CORRESPONDENTE: ")
         leia(posicao)
         ate((posicao >= 0) ou (posicao <=14))
         vet_modelo[posicao] <- vet_locados[posicao]
         vet_valor[posicao] <- vet_valorlocados[posicao]
         vet_locados[posicao] <- ""
         vet_valorlocados[posicao] <- 0


         escreval("DESEJA DEVOLVER MAIS ALGUM? S/N")
         leia(sair_devol)
         sair_devol <- Maiusc(sair_devol)
         se (sair_devol = "N") ent„o
            sair_devol <- "N"
         fimse
      senao
         escreval("NAO HA KARTS LOCADOS OU CADASTRADOS NO MOMENTO.")
         sair_devol <- "N"
      fimse
   ate(sair_devol = "N")
   retorne aux
fimfuncao

funcao mais_ganhou: caracter
var i: inteiro
   sair_ganho, aux: caracter
inicio
qtd_alu <- 0
   para i de 0 ate 14 passo 1 faca
       se(vet_maioralu[i] > qtd_alu)entao
            qtd_alu <- qtd_alu + vet_maioralu[i]
       fimse
   fimpara
      Escreval("O kart que mais gerou ganhos foi o  ",maior_alu)
      Escreval("Quantidade de aluguÈis: ",qtd_alu )



   retorne aux
fimfuncao

funcao alugar_circuito: caracter
var aux: caracter
inicio
   se (circuito = "") entao
      repita
         escreval("ALUGAR CIRCUITO? S/N")
         leia(circuito)
         circuito <- Maiusc(circuito)
      ate ((circuito = "S") ou (circuito = "N"))
   senao
      escreval("O CIRCUITO J¡ EST¡ LOCADO PELO VALOR DE R$", valor_circuito, ",00")
   fimse

   se (valor_circuito = 0) entao
      escreval("DIGITE O VALOR DO CIRCUITO: ")
      leia(valor_circuito)
   fimse

   retorne aux
fimfuncao


funcao receita_dia: caractere
var
   lucro_dia, receita, valor_locados: real
   i: inteiro
   aux: caracter

inicio

   para i de 0 ate 14 passo 1 faca
      se ((vet_locados[i] <> "") e (vet_valorlocados[i] > 0)) entao
         receita <- receita + vet_valorlocados[i]

         valor_locados <-((vet_valorlocados[i]*30)/100)
         lucro_dia <-  lucro_dia + valor_locados
      fimse
   fimpara
   se ((valor_circuito > 0) e (circuito = "S")) entao
      receita <- receita + valor_circuito

      lucro_dia <- lucro_dia + ((valor_circuito*70)/100)
   fimse
   escreval ("A RECEITA DO DIA FOI DE R$", receita,",00")
   escreval ("O LUCRO DO DIA FOI DE R$", lucro_dia, ",00")
   


   retorne aux
fimfuncao

procedimento atualizar_dia()
var
   i: inteiro
   kart: caracter
inicio
   se (circuito <> "N") entao
      repita
         escreval("MANTER CIRCUITO ALUGADO? S/N")
         leia(circuito)
         circuito <- Maiusc(circuito)
      ate ((circuito = "S") ou (circuito = "N"))
   fimse

   para i de 0 ate 14 passo 1 faca
      se (vet_locados[i] <> "") entao
         escreval("MANTER KART ", vet_locados[i],"?")
         leia(kart)
         se(kart = "S") entao
            vet_locados[i] <- vet_locados[i]
         senao
            vet_modelo[i] <- vet_locados[i]
            vet_valor[i] <- vet_valorlocados[i]
            vet_locados[i] <- ""
            vet_valorlocados[i] <- 0
         fimse
      fimse

   fimpara


fimprocedimento

Inicio
   rodada <- "S"
   enquanto (rodada = "S") faca
      escreval("BEM-VINDO AO GERENCIAMENTO DE LOCA«AO DE KARTS!!")
      escreval("DIGITE UM NUMERO PARA SELECIONAR A OP«AO DESEJADA")
      escreval

      repita
         escreval("1. CADASTRAR UM KART")
         escreval("2. LISTAR KARTS DISPONIVEIS")
         escreval("3. LISTAR KARTS LOCADOS")
         escreval("4. ALUGAR UM KART")
         escreval("5. DEVOLVER UM KART")
         escreval("6. KART QUE MAIS GEROU GANHOS")
         escreval("7. RECEITA E LUCROS DO DIA")
         escreval("8. LOCA«√O DE CIRCUITO")
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
            escreval("2. LISTAR KARTS DISPONIVEIS")

            escreval(listar_karts)
         caso 3
            escreval("3. LISTAR KARTS LOCADOS")

            escreval(listar_locados)

         caso 4
            escreval("4. ALUGAR UM KART")
            escreval(alugar_kart)

         caso 5
            escreval("5. DEVOLVER UM KART")

            escreval(devolver_kart)
         caso 6
            escreval("6. KART QUE MAIS GEROU GANHOS")
            escreval(mais_ganhou)
         caso 7
            escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
            escreval(receita_dia)
         caso 8
            escreval("8. LOCA«√O DE CIRCUITO")
            escreval(alugar_circuito)

         caso 9
            escreval("9. ATUALIZAR DIA")
            atualizar_dia()

         fimescolha
      ate((menu >= 1) e (menu <= 10))


      se(menu = 10) entao
         repita
            escreval("Tem certeza que deseja sair? S/N")
            leia(sair)
            sair <- Maiusc(sair)
            se(sair = "S")entao
               escreval("OBRIGADO PELA PREFERENCIA, VOLTE SEMPRE!!")
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
               escreval("OBRIGADO PELA PREFERENCIA, VOLTE SEMPRE!!")
            fimse
         ate ((rodada = "S") ou (rodada = "N"))
      fimse


   fimenquanto





Fimalgoritmo

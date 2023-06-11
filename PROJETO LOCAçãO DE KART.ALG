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
   mat_circuito: vetor[0..11,0..1] de caracter
   //inteiro
   menu: inteiro
   i: inteiro
   res: inteiro
   opcao: inteiro
   i_maior_valor:inteiro
   //real
   var_valor: real
   maior_valor: real
   //caracter
   rodada: caracter
   sair: caracter
   var_modelo: caracter
   sair_cadastro: caracter
   maior_kart: caracter
   

funcao cadastrar_kart: caracter
var aux: caracter
inicio
   sair_cadastro <- "S"

   enquanto (sair_cadastro <> "N") faca
      escreval("DIGITE O MODELO DO KART PARA O  CADASTRO:")
      leia(var_modelo)
      vet_modelo[i] <- var_modelo
      escreval("DIGITE O VALOR DO KART PARA O  CADASTRO:")
      leia(var_valor)
      vet_valor[i] <- var_valor
      i <- i+1
      escreval("DESEJA CADASTRAR OUTRO VEICULO? S/N")
      leia(sair_cadastro)
      sair_cadastro <- Maiusc(sair_cadastro)
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
var posicao, vazio: inteiro
   aux, sair_aluga: caracter
inicio
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

      vet_locados[posicao] <- vet_modelo[posicao]
      vet_valorlocados[posicao] <- vet_valor[posicao]
      vet_modelo[posicao] <- ""
      vet_valor[posicao] <- 0

      escreval("ALUGAR OUTRO KART DISPONIVEL? S/N")
      leia(sair_aluga)
      sair_aluga <- Maiusc(sair_aluga)
      se (sair_aluga = "N") ent„o
         sair_aluga <- "N"
      fimse
   atÈ (sair_aluga = "N")
  senao
   escreval("NAO HA KARTS DISPONIVEIS OU CADASTRADOS.")
 fimse

   retorne aux
fimfuncao

funcao devolver_kart: caracter
var  posicao,vazio, i: inteiro
aux, sair_devol: caracter
inicio
 para i de 0 ate 14 passo 1 faca
  se(vet_locados[i] <> "")entao
    vazio <- 1
  fimse
 fimpara

se(vazio = 1)entao
  repita
   escreval("DESEJA DEVOLVER QUAL KART LOCADO?")
   escreval(listar_locados)
   escreva("DIGITE O NUMERO CORRESPONDENTE: ")
   leia(posicao)
   
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
  ate(sair_devol = "N")
senao
  escreval("NAO HA KARTS LOCADOS OU CADASTRADOS NO MOMENTO.")
 fimse
   retorne aux
fimfuncao

funcao mais_ganhou: caracter
var posicao, i: inteiro
   sair_ganho, aux: caracter
inicio
   para i de 0 ate 14 passo 1 faca
      se (vet_locados[posicao] <> "") entao
         maior_valor <- vet_valorlocados[posicao]
      fimse
   fimpara
   maior_valor <- 0
   maior_kart <- ""
   se((vet_valorlocados[posicao] > maior_valor) e (vet_locados[posicao] > maior_kart)) entao
      maior_valor <- vet_valorlocados[posicao]
      maior_kart <- vet_locados[posicao]
      escreval("O KART ", maior_kart," FOI O QUE MAIS GEROU GANNHOS, ", maior_valor)
   senao
      escreval("NAO HA KARTS LOCADOS")
   fimse
   retorne aux
fimfuncao

procedimento listar_horarios()
var i,j: inteiro
inicio
   escreval("Grade de Hor·rios:")
   para i de 0 ate 11 faca
      para j de 0 ate 1 faca
         escreva(mat_circuito[i,j])
      fimpara
      escreval
   fimpara
fimprocedimento

procedimento alugar_circuito()
var i,j, horario: inteiro
   nome, sair_circuito: caracter
inicio
   sair_circuito <- "S"
   repita
      listar_horarios()
      escreval("Escolha o hor·rio que deseja:")
      leia(horario)
      escreval("Digite o nome de quem est· reservando: ")
      leia(nome)

      para i de 0 ate 11 faca
         para j de 0 ate 1 faca
            mat_circuito[(horario-1),1] <- nome
         fimpara
      fimpara

      escreval("Hor·rio escolhido: ", mat_circuito[(horario-1),0])

      escreval("Deseja reservar mais um hor·rio? S/N")
      leia(sair_circuito)
      sair_circuito <- Maiusc(sair_circuito)
   ate (sair_circuito = "N")
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
         escreval("7. RECEITA E LUCROS DO DIA (Considerando karts locados)")
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
         caso 8
            escreval("8. LOCA«√O DE CIRCUITO")
            mat_circuito[0,0] <- "1 - 08:00Hs"
            mat_circuito[1,0] <- "2 - 09:00Hs"
            mat_circuito[2,0] <- "3 - 10:00Hs"
            mat_circuito[3,0] <- "4 - 11:00Hs"
            mat_circuito[4,0] <- "5 - 12:00Hs"
            mat_circuito[5,0] <- "6 - 13:00Hs"
            mat_circuito[6,0] <- "7 - 14:00Hs"
            mat_circuito[7,0] <- "8 - 15:00Hs"
            mat_circuito[8,0] <- "9 - 16:00Hs"
            mat_circuito[9,0] <- "10 - 17:00Hs"
            mat_circuito[10,0] <- "11 - 18:00Hs"
            mat_circuito[11,0] <- "12 - 19:00Hs"

            escreval("Escolha a opÁao desejada: ")
            escreval("1 - Agendar horario")
            escreval("2 - Listar horarios")
            leia(opcao)
            escolha (opcao)
               caso 1
                  alugar_circuito()
               caso 2
                  listar_horarios()
            fimescolha

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

######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 #subtracao dos valores

# use pontos como separador de decimal. O que acontece se você usar virgula? #da erro
78 / 3 #os valores sao divididos
2 ^ 3 #dois elevado a 3 potencia
3 * 2 #os valores são mutiplicados
sqrt(2) #o resultado da raiz quadrada de 2
pi #valor de pi
log(x = 3,base = 10) #resultado de log de 3 na base 10
exp(x = 1) #exponencial de 1
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
#a expressao que será calculada #pra atribuir valor ao que esta a esquerda

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #criou um objeto 3
objeto1 #possibilita que o que ta dentro do objeto1 seja visto
objeto = 42
objeto #criou o objeto 42
objeto.2 <- 42 #criou um objeto 42
objeto.2 #possibilita que o que ta dentro do objeto1 seja visto
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa? #atribui um ou mais elementos ao nome que eu dei
objeto.cubico <- objeto^3 #cria um objeto com o do objeto ao cubo. O objeto eh 42.
resultado.1 <- (objeto.cubico / 3) + 7 #resultado da equacao
objeto.texto <- "texto sempre vem entre aspas" #cria um objeto com o texto entre aspas
objeto.texto #possibilita que o texto do objeto.texto seja visto
objeto.texto.2 <- "42" #cria um objeto com o texto "42"

objeto.vetor.1 = 1:34 #cria um vetor com uma sequencia que vai de 1 a 34
objeto.vetor.1 #possibilita que os elementos do objeto.vetor.1 seja visto
objeto.vetor2 = c(1, 74.5, 48) #cria um vetor com esses elementos
objeto.vetor2 #possibilita que os elementos do objeto.vetor2 seja visto

?seq #pede ajuda pra saber como cria uma sequencia
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #cria um vetor com uma sequencia quevai de 20 a 32, contando de 0.5 em 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #motra o valor minimo da seq objeto.vetor3
max(objeto.vetor3) #valor maximo da seq objeto.vetor3
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 #diz que a afirmacao eh verdadeira
objeto == objeto.2 #diz se um objeto eh exatamente igual ao outro #true
objeto == objeto.texto.2 #diz se um objeto eh exatamente igual ao outro #true
# o que aconteceu acima? #true
7.1 <= 7.001 #false
?"<" #ajuda

#pedindo ajuda
?pi
?log
??lm
help(log)
help.search("anova")

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho? #usando getwd

# Como você lista o conteúdo do diretório de trabalho?

# Como você define o diretório de trabalho?

# Como você carrega um arquivo de script?

# Como você salva os objetos que criou?

# Como você carrega os objetos que criou?

# Como ver quis objetos estão na sua área de trabalho?

# Como remover objetos da área de trabalho?

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol
objeto.texto
Objeto
source("chuchu.R")
source(chuchu.R)
setwd("C:/CavernaDoDragão")
getwd
Getwd()
#dica: quando o R der erro, copie e cole a mensagem de erro no google

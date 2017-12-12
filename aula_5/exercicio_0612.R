


####Conferindo Data Frames####
aves.c <- read.csv2("aves_cerrado.csv", row.names=1, as.is=T) #ler o arquivo
head(aves.c) #aparece os dados das primeiras linhas do data frame
tail(aves.c)#aparece os dados das linhas finais do fata frame

str(aves.c)
summary(aves.c) #mostra os resultados geral do data frame, como a media, or exemplo

is.na(aves.c)# mostra se tem NA em todo data frame
is.na(aves.c$urubu)# mostra se tem NA na coluna urubu
aves.c[is.na(aves.c$urubu),] #mostra em que linha o NA aparece na coluna urubu
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]#mostra em que linhas o NA aparece em todas as colunas listadas.
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #guarda o resultado anterior em um objeto.
aves.c$urubu[is.na(aves.c$urubu)] <- 0 #substitui o NA por 0
aves.c$carcara[is.na(aves.c$carcara)] <- 0# #substitui o NA por 0
aves.c$seriema[is.na(aves.c$seriema)] <- 0 ##substitui o NA por 0
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,] #mostra todas as linhas das coluna onde o aparece 0
temp1 #mostra o objeto.
table(aves.c$fisionomia) #verifica os valores da coluna que será um fator
aves.c$fisionomia[aves.c$fisionomia =="ce"] <- "Ce" #corringe erro de digitacao
table(aves.c$fisionomia) #mostrar 
aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
summary(aves.c) #verificando 

####Média, Mediana e Quantis####

mean(aves.c[,2:4]) #comando não funciona
sapply(aves.c[,2:4],mean)# media das 3 colunas com numeros
sapply(aves.c[,2:4],median)# mediana das 3 colunas com numeros

apply(aves.c[,2:4], 2, mean, trim=0.1) #media truncada

quantile(aves.c$urubu) ## O mesmo que o summary retorna
summary(aves.c$urubu)
quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1))

summary(aves.c[,2:4]) #mostra os dados de media, media, quantis


####Exploração de uma Variável Categórica####

caixeta <- read.csv("caixeta.csv", as.is=T)  #Ler o arquivo
names(caixeta)#mostra as variaveis do objeto
table(caixeta$especie)#mostra a coluna especies do objeto caixeta.
x11()
barplot(table(caixeta$local)) #plotar um grafico de barras com a coluna local.

####Gráficos para uma Variável####

par(mfrow=c(2,2)) #eh uma função e coloca os graficos a seguir em 2 colunas e 2 linhas
x11()
boxplot(aves.c$urubu)#gera grafico
hist(aves.c$urubu)#gera grafico
plot(density(aves.c$urubu))#gera grafico
stripchart(aves.c$urubu, method="stack")grafico
par(mfrow=c(1,1))

####Variações do Histograma####

## Histograma com os valores 
hist(aves.c$urubu)#gera um grafico
rug(aves.c$urubu)#da erro
rug(jitter(aves.c$urubu))#gera um grafico

hist(aves.c$urubu, prob=T)#histograma
lines( density(aves.c$urubu),col="blue" ) #plota uma linha azul que segue o pico do histograma
 
hist(aves.c$urubu, prob=T)
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red")# aplica uma linha de normalidde no grafico
plot(density(aves.c$urubu),col="blue", ylim=c(0,0.08))#curva de diversidade que depois ira sobrepor a curva de normalidade
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") #curva de normalidade plota em cima do anterior

####table e aggregate####

table(caixeta$especie,caixeta$local)
caixeta.alt <- aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),
                         FUN=mean)
####xtabs####

####xtabs####

Titanic.df <- read.csv("titanic.csv", as.is=T)#carregar o objeto Titanic.df com arquivo Titanic.csv
Titanic.df 
xtabs(Freq~Sex+Survived, data=Titanic.df)#cria uma tabela de contigência, Freq~Sex+Survived
?xtab
prop.table(xtabs(Freq~Sex+Survived, data=Titanic.df), margin=1)#mostra o resultado da tabela de contigencia em proporção.
?prop.table
xtabs(Freq~Class+Survived, data=Titanic.df)#cria uma tabela de contigencia, Freq~Class+Survived
prop.table(xtabs(Freq~Class+Survived, data=Titanic.df), margin=1)#mostra o resultado da tabela de contigencia em proporção.

table(Titanic.df$Sex,Titanic.df$Survived)

####Fórmula Estatística em Gráficos####
boxplot(urubu~fisionomia, data=aves.c)#boxplot de urubu em função da fisionomia.
plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce")#plot da variavel seriema em funcao de urubu

plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC")#plot da variavel seriema em funcao de urubu (quando a fisionomia for CC)
plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL")#plot da variavel seriema em funcao de urubu (quando a fisionomia for Cl)


library(lattice)
?lattice
xyplot(seriema~urubu|fisionomia, data= aves.c)#plota a variavel seriema em funcao da coluna urubu (condicionante fisionomia)


####O quarteto de Anscombe####
data(anscombe)#carrega para a area de trabalho
ls() #o objeto esta no workspace

names(anscombe)#carrega para a area de trabalho

apply(anscombe[1:4], MARGIN=2, FUN=mean) #media
apply(anscombe[5:8], 2, mean) #media

apply(anscombe[1:4], 2, var)#variância
apply(anscombe[5:8], 2, var)#variância

with(anscombe,cor(x1,y1))#testa a relacao entre as variaveis.
with(anscombe,cor(x2,y2))#testa a relacao entre as variaveis.
with(anscombe,cor(x3,y3))#testa a relacao entre as variaveis.
with(anscombe,cor(x4,y4))#testa a relacao entre as variaveis.

par(mfrow=c(2,2)) #quatro graficos em uma janela
plot(y1~x1, data=anscombe) #Plota Y1 em funcao de X1
plot(y2~x2, data=anscombe) #Plota Y2 em funcao de X2
plot(y3~x3, data=anscombe) #Plota Y3 em funcao de X3
plot(y4~x4, data=anscombe) #Plota Y4 em funcao de X4
par(mfrow=c(1,1)) #

par(mfrow=c(2,2)) # quatro graficos em uma janela
plot(y1~x1, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y1~x1, data=anscombe))
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))
par(mfrow=c(1,1))

#### Cervejas####

cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata") #cria o objeto cervejas
summary(cervejas)
tabela <- table(cervejas)# cria o objeto
tabela
x11()
cerveja = barplot(tabela)# grafico em barras por tipo de bebida
cervejadotplot = dotchart(as.vector(tabela), labels = c("chope", "garrafa", "lata", "nenhuma"))#grafico em pontos
      

####Caixetais####
caixeta = read.csv("caixeta.csv", sep= "," , dec=".")
str(tabcaixetas)
x11()
hist(caixeta$fuste)#histograma do fruste
hist(caixeta$h[caixeta$local=="chauas"])#histograma de chauas
hist(caixeta$h[caixeta$local=="retiro"])#histograma de retiro
hist(caixeta$h[caixeta$local=="jureia"])#histograma de jureia

####Eucaliptos####

eucalipt = read.table("eucalipto.php.csv", header=TRUE, sep=";", as.is=TRUE) #abrir o arquivo no r
eucalipt

boxplot(eucalipt$dap~eucalipt$regiao)#bloxplot  da variavel dap (em funcao da regiao)
boxplot(eucalipt$dap~eucalipt$rotacao)#bloxplot da variavel dap (em funcao da rotacao)
par(mfrow=c(2,2))#abre 2 linhas e 2 colunas de graficos na mesma janela
barplot(eucalipt$ht)#plotar graficos em barras da variavel ht
hist(eeucalipt$ht)#plotar histograma da variavel ht
qqnorm(eucalipt$ht)#plotar a normalidade para comparar.
qqline(eucalipt$ht)#plotar linha de normalidade para comparar.

####Mais Caixetais####
x11()
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]) #grafico da relacao de dap e h (somente para a especie T.cassinoides em  chauas)
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])# grafico da relacao de dap e h (somente para a especie T. cassinoides no retiro)
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])# grafico da relacao de dap e h (somente para a especie T. cassinoides em jureia)

scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])#verifica a linearidade da funcao
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])# verifica a lineaaridade da funcao
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])# verifica a linearidaade da funcao

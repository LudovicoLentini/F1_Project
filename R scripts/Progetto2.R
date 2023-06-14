#CARICO IL DATASET
setwd("C:/Users/aeman/OneDrive/Desktop/F1 2")
library(readr)
DB_FINAL <- read_csv("DB_FINAL.csv")
dati<-DB_FINAL

#RIPORTO I VARI TEAM CHE FANNO PARTE DELLA STESSA A CATEGORIA AD UN TEAM SOLO
table(dati$Team)
dati$Team[dati$Team=="Sauber"]<- "Alfa Romeo"
dati$Team[dati$Team=="Toro Rosso"]<- "AlphaTauri"
dati$Team[dati$Team=="Renault" | dati$Team=="Lotus F1"]<- "Alpine F1 Team"
dati$Team[dati$Team=="Force India" | dati$Team=="Racing Point"]<- "Aston Martin"
dati$Team[dati$Team=="Manor Marussia"]<- "Marussia"

#CREO LA VARIABILE DICOTOMICO DNF(=1 SE IL PILOTA HA AVUTO DNF E 0 ALTRIMENTI)
dati$DNF<- list(0)
DNF<-c(3,4,20,29,31,41,68,73,81,97,82,104,107,130,137)
for (i in DNF) {
  dati$DNF[dati$statusId==i]<- 1
}

#CARICO FILE DEL NUMERO DI GARE VINTE DA OGNI PILOTA FINO AL 2014
cumulata_vittorie<- read_csv("Vittorie per pilota prima del 2014.csv")
t<-data.frame(table(dati$Driver))
for (i in cumulata_vittorie$Driver) {
  t$Freq[t$Var1==i]<- cumulata_vittorie$`count(vittorie_pilota)`[cumulata_vittorie$Driver==i]
}
t$Freq[t$Var1!= "Alonso" & t$Var1!= "Hamilton" & t$Var1!= "Räikkönen" & t$Var1!= "Vettel" & t$Var1!= "Ricciardo" & t$Var1!= "Bottas" & t$Var1!= "Pérez" & t$Var1!= "Kubica" & t$Var1!= "Massa" & t$Var1!= "Button" & t$Var1!= "Rosberg" & t$Var1!= "Maldonado"]<-0
cumulata_vittorie_2014<- t

#CARICO IL FILE DEL NUMERO DI GARE CORSE DA OGNI PILOTA FINO AL 2014
t<-data.frame(table(dati$Driver))
cumulata_gare_2014 <- read_csv("GP disputati per pilota prima del 2014.csv")
for (i in cumulata_gare_2014$Driver) {
  t$Freq[t$Var1==i]<- cumulata_gare_2014$`count(raceId)`[cumulata_gare_2014$Driver==i]
}
t$Freq[t$Var1!= "Alonso" & t$Var1!= "Hamilton" & t$Var1!= "Räikkönen" & t$Var1!= "Vettel" & t$Var1!= "Ricciardo" & t$Var1!= "Bottas" & t$Var1!= "Pérez" & t$Var1!= "Kubica" & t$Var1!= "Massa" & t$Var1!= "Button" & t$Var1!= "Rosberg" & t$Var1!= "Maldonado" & t$Var1!= "Sutil" & t$Var1!= "Hülkenberg" & t$Var1!= "Kobayashi" & t$Var1!= "Grosjean" & t$Var1!= "Gutiérrez" & t$Var1!= "Vergne" & t$Var1!= "Chilton" & t$Var1!= "Bianchi" & t$Var1!= "di Resta" ]<-0
cumulata_gare_2014<-t

#CREO LA VARIABILE TASSO_WIN CHE INDICA LA PERCENTUALE DI VITTORIA
#DI OGNI PILOTA IN CIASCUNA CORSA
tasso_win<-list()
for (i in 1:nrow(dati)) {
  perc<- (cumulata_vittorie_2014$Freq[cumulata_vittorie_2014$Var1==dati$Driver[i]]/cumulata_gare_2014$Freq[cumulata_gare_2014$Var1==dati$Driver[i]])*100
  tasso_win<-append(tasso_win,perc)
  cumulata_gare_2014$Freq[cumulata_gare_2014$Var1==dati$Driver[i]]<-cumulata_gare_2014$Freq[cumulata_gare_2014$Var1==dati$Driver[i]]+1
  if(dati$driver_wins[i]==1)
    cumulata_vittorie_2014$Freq[cumulata_vittorie_2014$Var1==dati$Driver[i]]<- cumulata_vittorie_2014$Freq[cumulata_vittorie_2014$Var1==dati$Driver[i]]+1
}

dati$tasso_win<-tasso_win
dati$tasso_win[dati$tasso_win=="NaN"]<-0

View(dati)

#CREO LA VARIABILE TASSO_DNF CHE INDICA LA PERCENTUALE DI DNF DI CIASCUN PILOTA
#IN CIASCUNA GARA
cumulata_gare_2014_2021<- data.frame(table(dati$Driver))
cumulata_gare_2014_2021$Freq<-0

cumulata_DNF_2014_2021<- data.frame(table(dati$Driver))
cumulata_DNF_2014_2021$Freq<-0

tasso_DNF<-list()
for (i in 1:nrow(dati)) {
  perc<- (cumulata_DNF_2014_2021$Freq[cumulata_DNF_2014_2021$Var1==dati$Driver[i]]/cumulata_gare_2014_2021$Freq[cumulata_gare_2014_2021$Var1==dati$Driver[i]])*100
  tasso_DNF<-append(tasso_DNF,perc)
  cumulata_gare_2014_2021$Freq[cumulata_gare_2014_2021$Var1==dati$Driver[i]]<-cumulata_gare_2014_2021$Freq[cumulata_gare_2014_2021$Var1==dati$Driver[i]]+1
  if(dati$DNF[i]==1)
    cumulata_DNF_2014_2021$Freq[cumulata_DNF_2014_2021$Var1==dati$Driver[i]]<-cumulata_DNF_2014_2021$Freq[cumulata_DNF_2014_2021$Var1==dati$Driver[i]]+1
}

dati$tasso_DNF<-tasso_DNF
dati$tasso_DNF[dati$tasso_DNF=="NaN"]<-0


#CREO UN SOTTODATASET CON LE VARIABILE DI MIO INTERESSE PER IL MODELLO
dati1<-data.frame(dati$positionText,dati$year,dati$Driver,dati$quali_position,dati$fastestLapTime,dati$fastestLapSpeed , dati$Team,dati$driver_nationality,dati$circuitRef,dati$lat,dati$lng,dati$alt)
dati1$tasso_win<- dati$tasso_win
dati1$tasso_DNF<-dati$tasso_DNF
dati1$dati.fastestLapTime<-as.numeric(dati1$dati.fastestLapTime)
dati1$tasso_DNF<-as.numeric(dati1$tasso_DNF)
dati1$tasso_win<-as.numeric(dati1$tasso_win)

#DIVIDO IN TRAIN E TEST
train<-subset(dati1, dati.year<2021)
train1<- subset(train, dati.Driver=="Alonso" | dati.Driver=="Bottas" | dati.Driver=="Gasly" | dati.Driver=="Giovinazzi" | dati.Driver=="Hamilton" | dati.Driver=="Kubica" | dati.Driver=="Latifi" | dati.Driver=="Leclerc" | dati.Driver=="Norris" | dati.Driver=="Ocon" | dati.Driver=="Pérez" | dati.Driver=="Räikkönen" | dati.Driver=="Ricciardo" | dati.Driver=="Russell" | dati.Driver=="Sainz" | dati.Driver=="Stroll" | dati.Driver=="Verstappen" | dati.Driver=="Vettel")
train2<- subset(train1, dati.circuitRef=="americas" | dati.circuitRef=="bahrain" | dati.circuitRef=="baku" | dati.circuitRef=="catalunya" | dati.circuitRef=="hungaroring" | dati.circuitRef=="imola" | dati.circuitRef=="interlagos" | dati.circuitRef=="istanbul" | dati.circuitRef=="monaco" | dati.circuitRef=="monza" | dati.circuitRef=="portimao" | dati.circuitRef=="red_bull_ring" | dati.circuitRef=="ricard" | dati.circuitRef=="rodriguez" | dati.circuitRef=="silverstone" | dati.circuitRef=="sochi" | dati.circuitRef=="spa" | dati.circuitRef=="yas_marina")
train2<-subset(train2, dati.Team!="Marussia")
test<- subset(dati1, dati.year==2021)
test1<-subset(test, dati.Driver!= "Mazepin" & dati.Driver!= "Schumacher" & dati.Driver!= "Tsunoda" & dati.circuitRef!= "jeddah" & dati.circuitRef!= "losail" & dati.circuitRef!= "zandvoort" )
test2<-test1[,-1]


#RICODIFICA VARIABILE DIPENDENTE TRAIN
train2$dati.positionText<-as.numeric(train2$dati.positionText)
train2$dati.positionText<- ifelse(train2$dati.positionText<4,1,ifelse(train2$dati.positionText<11,2,3))
train2$dati.positionText[is.na(train2$dati.positionText)==TRUE]<-3
#RICODIFICA VARIABILE DIPENDENTE TEST
test1$dati.positionText<-as.numeric(test1$dati.positionText)
test1$dati.positionText<- ifelse(test1$dati.positionText<4,1,ifelse(test1$dati.positionText<11,2,3))
test1$dati.positionText[is.na(test1$dati.positionText)==TRUE]<-3


require(foreign)
require(ggplot2)
require(MASS)
require(Hmisc)
require(reshape2)

#ORDERED LOGISTIC REGRESSION
m <- polr(as.factor(dati.positionText) ~. , data = train2[,c(1,3,4,5,6,7,9,13)], Hess=TRUE)
c<-data.frame(test2[,c(2,3,4,5,6,8,12)])
pred<-predict(m,c)
predd<- data.frame(test1$dati.positionText,pred)
table(test1$dati.positionText,pred)
library(Metrics)
rmse(as.numeric(predd$test1.dati.positionText[is.na(predd$pred)==FALSE]),as.numeric(predd$pred[is.na(predd$pred)==FALSE]))

#LOGISTIC REGRESSION DI TIPO LOGIT
m.1<- glm(as.factor(dati.positionText) ~. ,data = train2[,c(1,3,4,5,6,7,9,13)],family=binomial(link="logit"))
c.1<-data.frame(test2[,c(2,3,4,5,6,8,12)])
pred.1<-predict(m.1,c.1)
predd.1<- data.frame(test1$dati.positionText,pred.1)
rmse(as.numeric(predd.1$test1.dati.positionText[is.na(predd.1$pred.1)==FALSE]),as.numeric(predd.1$pred.1[is.na(predd.1$pred.1)==FALSE]))

#LOGISTIC REGRESSION DI TIPO PROBIT
m.2<- glm(as.factor(dati.positionText) ~. ,data = train2[,c(1,3,4,5,6,7,9,13)],family=binomial(link="probit"))
c.2<-data.frame(test2[,c(2,3,4,5,6,8,12)])
pred.2<-predict(m.2,c.2)
predd.2<- data.frame(test1$dati.positionText,pred.2)
rmse(as.numeric(predd.2$test1.dati.positionText[is.na(predd.2$pred.2)==FALSE]),as.numeric(predd.2$pred.2[is.na(predd.2$pred.2)==FALSE]))

#LASSO 1

library(lasso2)

mod.lasso <- l1ce(as.double(dati.positionText) ~.,data = train2[,c(1,3,4,5,6,7,9,13)])
summ <- summary(mod.lasso)
summ$coefficients

#LASSO 2 

mod_glmnet <- glmnet(x = train2[,-1], y = train2[,1], family = "gaussian")

#(Problemi con la matrice)
cvfit <- cv.glmnet(x = train2[,-1], y = train2[,1])
cvfit

#RIDGE

library(MASS)

lam.grid <- seq(0, 1e-05, length.out = 100)
length(lam.grid)               


rid.one = lm.ridge(train2$dati.positionText ~. ,data = train2[,c(1,3,4,5,6,7,9,13)], lambda = lam.grid, standardize=TRUE)

class(rid.one)
rid.one$coef
names(rid.one)
dim(rid.one$coef)
plot(rid.one,xvar="lambda",label=TRUE)

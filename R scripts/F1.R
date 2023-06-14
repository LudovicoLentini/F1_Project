# PROGETTO FORMULA 1 STATISTICAL LEARNING

library(data.table)
DB<-fread(file = "DB_FINAL.csv")


table(DB$Team)
DB$Team[DB$Team=="Sauber"]<- "Alfa Romeo"
DB$Team[DB$Team=="Toro Rosso"]<- "AlphaTauri"
DB$Team[DB$Team=="Renault" | DB$Team=="Lotus F1"]<- "Alpine F1 Team"
DB$Team[DB$Team=="Force India" | DB$Team=="Racing Point"]<- "Aston Martin"
DB$Team[DB$Team=="Manor Marussia"]<- "Marussia"
table(DB$Team)
table(DB$country)
table(DB$status_text)
DB$DNF<- list(0)
DNF<-c(3,4,20,29,31,41,68,73,81,97,82,104,107,130,137)
for (i in DNF) {
  DB$DNF[DB$statusId==i]<- 1
}

table(DB$Driver)
View(DB)


#dati1<-data.frame(DB$raceId,DB$grid,DB$year,DB$Driver,DB$quali_position,DB$fastestLapTime,DB$fastestLapSpeed,DB$Team,DB$driver_nationality,DB$circuitRef,DB$lat,DB$lng,DB$alt)
#dati1$dati.fastestLapTime<-as.numeric(dati1$dati.fastestLapTime)
#train<-subset(dati1, dati.year<2021)
#test<- subset(dati1, dati.year==2021)

#require(foreign)
#require(ggplot2)
#require(MASS)
#require(Hmisc)
#require(reshape2)


#PILOTI 

a=max(DB$driver_points[DB$year=='2014'])
a1=max(DB$driver_points[DB$year=='2015'])
b=max(DB$driver_points[DB$year=='2016'])
c=max(DB$driver_points[DB$year=='2017'])
d=max(DB$driver_points[DB$year=='2018'])
e=max(DB$driver_points[DB$year=='2019'])
f=max(DB$driver_points[DB$year=='2020'])
g=max(DB$driver_points[DB$year=='2021'])

DB$Driver[DB$driver_points==a]
DB$Driver[DB$driver_points==a1]
DB$Driver[DB$driver_points==b]
DB$Driver[DB$driver_points==c]
DB$Driver[DB$driver_points==d]
DB$Driver[DB$driver_points==e]
DB$Driver[DB$driver_points==f]
DB$Driver[DB$driver_points==g]

x=c(a,a1,b,c,d,e,f,g)

barplot(x,names.arg = c("Hamilton","Hamilton","Rosberg","Hamilton","Hamilton","Hamilton","Hamilton","Verstappen"),
        xlab="Drivers", ylab="Points",cex.lab = 1.2,main = "Drivers Word Championship in past years")
leg.txta0="2014"
leg.txta="2015"
leg.txta1="2016"
leg.txta2="2017"
leg.txta3="2018"
leg.txta4="2019"
leg.txta5="2020"
leg.txta6="2021"
legend(-0.3,300,leg.txta0, bty="n",horiz = TRUE)
legend(0.82,300,leg.txta, bty = "n", horiz = TRUE)
legend(2.10,300,leg.txta1, bty="n",horiz = TRUE)
legend(3.22,300,leg.txta2, bty="n",horiz = TRUE)
legend(4.46,300,leg.txta3, bty="n",horiz = TRUE)
legend(5.67,300,leg.txta4, bty="n",horiz = TRUE)
legend(6.87,300,leg.txta5, bty="n",horiz = TRUE)
legend(8.1,300,leg.txta6, bty="n",horiz = TRUE)


#COSTRUTTORI

h=max(DB$team_points[DB$year=='2014'])
h1=max(DB$team_points[DB$year=='2015'])
i=max(DB$team_points[DB$year=='2016'])
l=max(DB$team_points[DB$year=='2017'])
m=max(DB$team_points[DB$year=='2018'])
n=max(DB$team_points[DB$year=='2019'])
o=max(DB$team_points[DB$year=='2020'])
p=max(DB$team_points[DB$year=='2021'])

y=c(h,h1,i,l,m,n,o,p)

DB$Team[DB$team_points==h]
DB$Team[DB$team_points==h1]
DB$Team[DB$team_points==i]
DB$Team[DB$team_points==l]
DB$Team[DB$team_points==m]
DB$Team[DB$team_points==n]
DB$Team[DB$team_points==o]
DB$Team[DB$team_points==p]


barplot(y,names.arg = c("Mercedes","Mercedes","Mercedes","Mercedes","Mercedes","Mercedes","Mercedes","Mercedes"),
        xlab="Constructor teams", ylab="Points",cex.lab = 1.2,main = "Constructor Word Championship in past years")
legend(-0.3,500,leg.txta0, bty="n",horiz = TRUE)
legend(0.82,500,leg.txta, bty = "n", horiz = TRUE)
legend(2.10,500,leg.txta1, bty="n",horiz = TRUE)
legend(3.22,500,leg.txta2, bty="n",horiz = TRUE)
legend(4.46,500,leg.txta3, bty="n",horiz = TRUE)
legend(5.67,500,leg.txta4, bty="n",horiz = TRUE)
legend(6.87,500,leg.txta5, bty="n",horiz = TRUE)
legend(8.1,500,leg.txta6, bty="n",horiz = TRUE)

#MEDIA PUNTI PER GARA DEI 3 TOP COSTRUTTORI NEGLI ANNI

DB2014=subset(DB, year=='2014')

m14=mean(DB2014$constructor_points[DB2014$Team=="Mercedes"])
f14=mean(DB2014$constructor_points[DB2014$Team=="Ferrari"])
r14=mean(DB2014$constructor_points[DB2014$Team=="Red Bull"])


DB2015 = subset(DB,year=='2015')

m15=mean(DB2015$constructor_points[DB2015$Team=="Mercedes"])
f15=mean(DB2015$constructor_points[DB2015$Team=="Ferrari"])
r15=mean(DB2015$constructor_points[DB2015$Team=="Red Bull"])

DB2016 = subset(DB,year=='2016')

m16=mean(DB2016$constructor_points[DB2016$Team=="Mercedes"])
f16=mean(DB2016$constructor_points[DB2016$Team=="Ferrari"])
r16=mean(DB2016$constructor_points[DB2016$Team=="Red Bull"])

DB2017 = subset(DB,year=='2017')

m17=mean(DB2017$constructor_points[DB2017$Team=="Mercedes"])
f17=mean(DB2017$constructor_points[DB2017$Team=="Ferrari"])
r17=mean(DB2017$constructor_points[DB2017$Team=="Red Bull"])

DB2018 = subset(DB,year=='2018')
m18=mean(DB2018$constructor_points[DB2018$Team=="Mercedes"])
f18=mean(DB2018$constructor_points[DB2018$Team=="Ferrari"])
r18=mean(DB2018$constructor_points[DB2018$Team=="Red Bull"])

DB2019 = subset(DB,year=='2019')
m19=mean(DB2019$constructor_points[DB2019$Team=="Mercedes"])
f19=mean(DB2019$constructor_points[DB2019$Team=="Ferrari"])
r19=mean(DB2019$constructor_points[DB2019$Team=="Red Bull"])

DB2020 = subset(DB, year=='2020')
m20=mean(DB2020$constructor_points[DB2020$Team=="Mercedes"])
f20=mean(DB2020$constructor_points[DB2020$Team=="Ferrari"])
r20=mean(DB2020$constructor_points[DB2020$Team=="Red Bull"])

DB2021 = subset(DB,year=='2021')
m21=mean(DB2021$constructor_points[DB2021$Team=="Mercedes"])
f21=mean(DB2021$constructor_points[DB2021$Team=="Ferrari"])
r21=mean(DB2021$constructor_points[DB2021$Team=="Red Bull"])

M=c(m14,m15,m16,m17,m18,m19,m20,m21)
F=c(f14,f15,f16,f17,f18,f19,f20,f21)
R=c(r14,r15,r16,r17,r18,r19,r20,r21)

t=c(2014,2015,2016,2017,2018,2019,2020,2021)

plot(t,M,type="l",col="black",cex.axis=1.2,xaxt="n", ylab = "Constructors",xlab = "year", main = "Average Mercedes's points",lwd=2) 
axis(1,at=c(2014,2015,2016,2017,2018,2019,2020,2021),labels = c("2014","2015","2016","2017","2018","2019","2020","2021"),cex.axis=1.2)
#par(new=TRUE)
plot(t,F, type="l",col="red",xaxt="n", ylab = "Constructors",xlab = "year", main = "Average Ferrari's points",lwd=2)
axis(1,at=c(2014,2015,2016,2017,2018,2019,2020,2021),labels = c("2014","2015","2016","2017","2018","2019","2020","2021"),cex.axis=1.2)
#par(new=TRUE)
plot(t,R, type="l",col="blue",xaxt="n", ylab = "Constructors",xlab = "year", main = "Average Red Bull's points",lwd=2)
axis(1,at=c(2014,2015,2016,2017,2018,2019,2020,2021),labels = c("2014","2015","2016","2017","2018","2019","2020","2021"),cex.axis=1.2)


#GRAFICI PILOTI PER VITTORIE POLE E DNF

#2014

table(DB2014$Driver[DB2014$positionText==1])
table(DB2014$Driver[DB2014$quali_position==1])
table(DB2014$Driver[DB2014$DNF==1])

w14=c(11,0,3,5)
q14=c(7,1,0,11)
v14=c(1,4,0,0)

barplot(rbind(w14,q14,v14),width=3 ,beside = T, names.arg = c("Hamilton","Massa","Ricciardo","Rosberg"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2014",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(17,12,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2015

table(DB2015$Driver[DB2015$positionText==1])
table(DB2015$Driver[DB2015$quali_position==1])
table(DB2015$Driver[DB2015$DNF==1])

w15=c(10,6,3)
q15=c(11,7,1)
v15=c(0,0,1)

barplot(rbind(w15,q15,v15),width=3 ,beside = T, names.arg = c("Hamilton","Rosberg","Vettel"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2015",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(27,11,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2016

table(DB2016$Driver[DB2016$positionText==1])
table(DB2016$Driver[DB2016$quali_position==1])
table(DB2016$Driver[DB2016$DNF==1])

w16=c(10,1,9,1)
q16=c(12,1,8,0)
v16=c(1,0,1,1)

barplot(rbind(w16,q16,v16),width=3 ,beside = T, names.arg = c("Hamilton","Ricciardo","Rosberg","Verstappen"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2016",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(37,13,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2017

table(DB2017$Driver[DB2017$positionText==1])
table(DB2017$Driver[DB2017$quali_position==1])
table(DB2017$Driver[DB2017$DNF==1])

w17=c(3,9,0,1,2,5)
q17=c(4,11,1,0,0,4)
v17=c(0,0,2,1,3,1)

barplot(rbind(w17,q17,v17),width=6 ,beside = T, names.arg = c("Bottas","Hamilton","Raikkonen","Ricciardo","Verstappen","Vettel"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2017",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(95,10,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2018

table(DB2018$Driver[DB2018$positionText==1])
table(DB2018$Driver[DB2018$quali_position==1])
table(DB2018$Driver[DB2018$DNF==1])

w18=c(0,11,1,2,2,5)
q18=c(2,11,1,2,0,5)
v18=c(1,0,0,2,2,1)

barplot(rbind(w18,q18,v18),width=6 ,beside = T, names.arg = c("Bottas","Hamilton","Raikkonen","Ricciardo","Verstappen","Vettel"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2018",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(95,10,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2019

table(DB2019$Driver[DB2019$positionText==1])
table(DB2019$Driver[DB2019$quali_position==1])
table(DB2019$Driver[DB2019$DNF==1])

w19=c(4,11,2,3,1)
q19=c(5,5,6,3,2)
v19=c(1,0,3,1,1)

barplot(rbind(w19,q19,v19),width=5 ,beside = T, names.arg = c("Bottas","Hamilton","Leclerc","Verstappen","Vettel"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2019",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(70,12,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2020

table(DB2020$Driver[DB2020$positionText==1])
table(DB2020$Driver[DB2020$quali_position==1])
table(DB2020$Driver[DB2020$DNF==1])

w20=c(2,1,11,1,0,2)
q20=c(4,0,10,0,1,1)
v20=c(0,1,0,0,4,3)

barplot(rbind(w20,q20,v20),width=6 ,beside = T, names.arg = c("Bottas","Gasly","Hamilton","Perez","Stroll","Verstappen"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2020",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(100,12,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#2021

table(DB2021$Driver[DB2021$positionText==1])
table(DB2021$Driver[DB2021$quali_position==1])
table(DB2021$Driver[DB2021$DNF==1])

w21=c(1,8,0,0,1,1,1,10)
q21=c(3,8,2,1,0,0,0,8)
v21=c(3,1,1,1,1,2,0,3)

barplot(rbind(w21,q21,v21),width=8 ,beside = T, names.arg = c("Bottas","Hamilton","Leclerc","Norris","Ocon","Perez","Ricciardo","Verstappen"), col = c("green","blue","red"), main="Wins/pole position/DNF in 2021",
        xlab="Drivers")
leg.txta =c("Wins","Pole position","DNF")
legend(97,10,leg.txta,lty=1, bty="n", col =c("green","blue","red"), lwd = 6 ,seg.len = 0.3)

#GRAFICI TEAMS PER PODI/POLE E STATUS

#2014

table(DB2014$Team[DB2014$positionText==1])
table(DB2014$Team[DB2014$positionText==2])
table(DB2014$Team[DB2014$positionText==3])

table(DB2014$Team[DB2014$quali_position==1])

f14=c(0,0,0,16,3,0)
s14=c(0,1,1,13,1,0)
t14=c(1,1,1,2,8,6)
p14=c(0,0,0,18,0,1)

barplot(rbind(f14,s14,t14,p14),width=6 ,beside = T, names.arg = c("Aston Martin","Ferrari","McLaren","Mercedes","Red Bull","Williams"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2014",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(17,20,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2015

table(DB2015$Team[DB2015$positionText==1])
table(DB2015$Team[DB2015$positionText==2])
table(DB2015$Team[DB2015$positionText==3])

table(DB2015$Team[DB2015$quali_position==1])

f15=c(0,0,3,16,0,0)
s15=c(0,0,4,13,2,0)
t15=c(1,1,9,3,1,4)
p15=c(0,0,1,19,0,0)


barplot(rbind(f15,s15,t15,p15),width=6 ,beside = T, names.arg = c("Alpine Team","Aston Martin","Ferrari","Mercedes","Red Bull","Williams"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2015",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(17,20,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2016

table(DB2016$Team[DB2016$positionText==1])
table(DB2016$Team[DB2016$positionText==2])
table(DB2016$Team[DB2016$positionText==3])

table(DB2016$Team[DB2016$quali_position==1])

f16=c(0,0,19,2,0)
s16=c(0,5,8,8,0)
t16=c(2,6,6,6,1)
p16=c(0,0,20,1,0)

barplot(rbind(f16,s16,t16,p16),width=5 ,beside = T, names.arg = c("Aston Martin","Ferrari","Mercedes","Red Bull","Williams"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2016",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(11,22,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2017

table(DB2017$Team[DB2017$positionText==1])
table(DB2017$Team[DB2017$positionText==2])
table(DB2017$Team[DB2017$positionText==3])

table(DB2017$Team[DB2017$quali_position==1])

f17=c(5,12,3,0)
s17=c(8,10,2,0)
t17=c(7,4,8,1)
p17=c(5,15,0,0)

barplot(rbind(f17,s17,t17,p17),width=4 ,beside = T, names.arg = c("Ferrari","Mercedes","Red Bull","Williams"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2017",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(61,15,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2018

table(DB2018$Team[DB2018$positionText==1])
table(DB2018$Team[DB2018$positionText==2])
table(DB2018$Team[DB2018$positionText==3])

table(DB2018$Team[DB2018$quali_position==1])

f18=c(0,6,11,4)
s18=c(0,7,10,4)
t18=c(1,11,4,5)
p18=c(0,6,13,2)


barplot(rbind(f18,s18,t18,p18),width=4 ,beside = T, names.arg = c("Aston Martin","Ferrari","Mercedes","Red Bull"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2018",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(5,14,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2019 

table(DB2019$Team[DB2019$positionText==1])
table(DB2019$Team[DB2019$positionText==2])
table(DB2019$Team[DB2019$positionText==3])

table(DB2019$Team[DB2019$quali_position==1])

f19=c(0,3,0,15,3)
s19=c(1,7,0,11,2)
t19=c(1,9,1,6,4)
p19=c(0,8,0,10,3)


barplot(rbind(f19,s19,t19,p19),width=5 ,beside = T, names.arg = c("AlphaTauri","Ferrari","McLaren","Mercedes","Red Bull"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2019",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(3,16,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2020

table(DB2020$Team[DB2020$positionText==1])
table(DB2020$Team[DB2020$positionText==2])
table(DB2020$Team[DB2020$positionText==3])

table(DB2020$Team[DB2020$quali_position==1])

f20=c(1,0,1,0,0,13,2)
s20=c(0,1,1,1,1,7,6)
t20=c(0,2,2,2,1,5,5)
p20=c(0,0,1,0,0,15,1)


barplot(rbind(f20,s20,t20,p20),width=7 ,beside = T, names.arg = c("AlphaTauri","Alpine Team","Aston Martin","Ferrari","McLaren","Mercedes","Red Bull"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2020",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(17,15,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

#2021

table(DB2021$Team[DB2021$positionText==1])
table(DB2021$Team[DB2021$positionText==2])
table(DB2021$Team[DB2021$positionText==3])

table(DB2021$Team[DB2021$quali_position==1])

f21=c(0,1,0,0,1,9,11,0)
s21=c(0,0,1,2,1,9,8,1)
t21=c(1,1,0,3,3,10,4,0)
p21=c(0,0,0,2,1,11,8,0)

barplot(rbind(f21,s21,t21,p21),width=8 ,beside = T, names.arg = c("AlphaTauri","Alpine Team","Aston Martin","Ferrari","McLaren","Mercedes","Red Bull","Williams"), col = c("Gold","Grey","Brown","Blue"), main="Placement in races and pole positions in 2021",
        xlab="Constructor Teams")
leg.txta =c("First place","Second place","Third place","Pole position")
legend(17,12,leg.txta,lty=1, bty="n", col =c("Gold","Grey","Brown","Blue"), lwd = 6 ,seg.len = 0.3)

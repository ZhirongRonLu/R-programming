library(Stat2Data)
data(Tadpoles)
library(ggplot2)
library(HH)
plot(GutLength~Body,col=Treatment,data=Tadpoles)
Tadpoles$Treatment<-c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0)
regmodel0=lm(GutLength~Body+MouthpartDamage+Treatment,data=Tadpoles)
summary(regmodel0)

data("CrabShip")
plot(Oxygen~Mass,col=Noise,data=CrabShip)
CrabShip$Noise<-c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0)
regmodel=lm(Oxygen~Mass+Noise+Mass*Noise,data=CrabShip)
summary(regmodel)

data("MLBStandings2016")
regmodel5=lm(WinPct~Runs,data=MLBStandings2016)
summary(regmodel5)
regmodel6=lm(WinPct~Runs+Hits+Runs*Hits,data=MLBStandings2016)
summary(regmodel6)

data("HighPeaks")
library(car)
plot(Time~Elevation,data=HighPeaks)
regmodel=lm(Time~Elevation,data=HighPeaks)
summary(regmodel)
regmodel7=lm(Time~Elevation+Length+Elevation*Length,data=HighPeaks)
summary(regmodel7)
avPlots(regmodel7)

data("MLBStandings2016")
regmodel=lm(WinPct~BattingAverage,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~Hits,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~HR,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~Doubles,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~Triples,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~RBI,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~SB,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~OBP,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~SLG,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~HitsAllowed,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~Walks,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~StrikeOuts,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~Saves,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~WHIP,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+BattingAverage,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+Hits,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+HR,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+Doubles,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+Triples,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+RBI,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+SB,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+OBP,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+SLG,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+HitsAllowed,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+Walks,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+StrikeOuts,data=MLBStandings2016)
summary(regmodel)
regmodel=lm(WinPct~ERA+Runs+Saves+WHIP,data=MLBStandings2016)
summary(regmodel)



MLBStandings2016$Team<-NULL
MLBStandings2016$League<-NULL
MLBStandings2016$Wins<-NULL
MLBStandings2016$Losses<-NULL
all=regsubsets(WinPct~.,nbest=5,data=MLBStandings2016)
ShowSubsets=function(regout){
  z=summary(regout)
  q=as.data.frame(z$outmat)
  q$Rsq=round(z$rsq*100,2)
  q$adjRsq=round(z$adjr2*100,2)
  q$Cp=round(z$cp,2)
  return(q)
}
ShowSubsets(all)




regmodel=lm(WinPct~BattingAverage+Runs+Saves+WHIP,data=MLBStandings2016)
summary(regmodel)

#4.15
data(Blood1)
regmodel1=lm(SystolicBP~Overwt,data=Blood1)
summary(regmodel1)
Blood1$Overwt[Blood1$Overwt==2]<-1
regmodel2=lm(SystolicBP~Overwt,data=Blood1)
summary(regmodel2)
full_model<-lm(SystolicBP~.,data=Blood1)
ols_mallows_cp(regmodel1,full_model)
ols_mallows_cp(regmodel2,full_model)

library(mosaic)
library(ggplot2)
library(dplyr)
library(coefplot)
data("FishEggs")
regmodel=lm(PctDM~Age,data=FishEggs)
summary(regmodel)
#plot(regmodel)
color1<-ifelse(FishEggs$Sept==0,"blue","red")
plot(regmodel$residuals~regmodel$fitted.values,col=color1)
regmodel=lm(PctDM~Age+Sept,data=FishEggs)
summary(regmodel)
#plot(regmodel)
color1<-ifelse(FishEggs$Sept==0,"blue","red")
plot(regmodel$residuals~regmodel$fitted.values,col=Month)

data("Diamonds")
regmodel=lm(TotalPrice~Depth+Carat+Carat*Depth,data=Diamonds)
summary(regmodel)
anova(regmodel)

data("Meniscus")

dataa(CloudSeeding2)

data(lec_car_data)

lec_car_data=read.csv("/Users/guaarmstrong/Downloads/example.csv")
regmodel=lm(RPM~Throttle+Brake,data=lec_car_data)
summary(regmodel)
plot(regmodel)

regmodel2=aov(Speed~as.factor(nGear),data=lec_car_data)
TukeyHSD(regmodel2)
plot(TukeyHSD(regmodel2))

example2=read.csv("/Users/guaarmstrong/Downloads/example2.csv")
regmodel=lm(TrackTemp~AirTemp+Humidity+Pressure+WindSpeed,data=example2)
summary(regmodel)
plot(regmodel)

%%Track Temperature
TT1_1=read.csv("/Users/guaarmstrong/Downloads/example3.csv")
TT1_1$year<-2020
TT1_1$circuitId<-1
TT1_2=read.csv("/Users/guaarmstrong/Downloads/TT1-2.csv")
TT1_2$year<-2019
TT1_2$circuitId<-1
TT1_3=read.csv("/Users/guaarmstrong/Downloads/TT1-3.csv")
TT1_3$year<-2018
TT1_3$circuitId<-1
TT2_1=read.csv("/Users/guaarmstrong/Downloads/TT2-1.csv")
TT2_1$year<-2020
TT2_1$circuitId<-2
TT2_2=read.csv("/Users/guaarmstrong/Downloads/TT2-2.csv")
TT2_2$year<-2019
TT2_2$circuitId<-2
TT2_3=read.csv("/Users/guaarmstrong/Downloads/TT2-3.csv")
TT2_3$year<-2018
TT2_3$circuitId<-2
TT3_1=read.csv("/Users/guaarmstrong/Downloads/TT3-1.csv")
TT3_1$year<-2020
TT3_1$circuitId<-3
TT3_2=read.csv("/Users/guaarmstrong/Downloads/TT3-2.csv")
TT3_2$year<-2019
TT3_2$circuitId<-3
TT3_3=read.csv("/Users/guaarmstrong/Downloads/TT3-3.csv")
TT3_3$year<-2018
TT3_3$circuitId<-3
example3$Time<-NULL
example3$Rainfall<-NULL
regmodel=lm(TrackTemp~AirTemp+Humidity+Pressure+WindSpeed+AirTemp:as.factor(circuitId)+Humidity:as.factor(circuitId)+Pressure:as.factor(circuitId)+AirTemp:Humidity+AirTemp:Pressure+AirTemp:WindSpeed+Humidity:Pressure+Humidity:WindSpeed+Pressure:WindSpeed+as.factor(circuitId)+as.factor(year),data=WeatherTotal)
summary(regmodel)##model1
regmodel=aov(sqrt(TrackTemp)~AirTemp+Humidity+Pressure+AirTemp:as.factor(year)+Humidity:as.factor(year)+Pressure:as.factor(year)+WindSpeed:as.factor(year)+AirTemp:as.factor(circuitId)+Humidity:as.factor(circuitId)+Pressure:as.factor(circuitId)+WindSpeed:as.factor(circuitId)+AirTemp:Humidity+AirTemp:Pressure+Humidity:Pressure+Pressure:WindSpeed+as.factor(circuitId)+as.factor(year),data=WeatherTotal)
summary(regmodel)
regmodel=lm(sqrt(TrackTemp)~AirTemp+Humidity+Pressure+AirTemp:as.factor(year)+Humidity:as.factor(year)+Pressure:as.factor(year)+WindSpeed:as.factor(year)+AirTemp:as.factor(circuitId)+Humidity:as.factor(circuitId)+WindSpeed:as.factor(circuitId)+AirTemp:Humidity+AirTemp:Pressure+Humidity:Pressure+Pressure:WindSpeed+as.factor(circuitId)+as.factor(year),data=WeatherTotal)
summary(regmodel)
plot(regmodel)
all=regsubsets(TrackTemp~.,nbest=5,data=example3)
ShowSubsets=function(regout){
  z=summary(regout)
  q=as.data.frame(z$outmat)
  q$Rsq=round(z$rsq*100,2)
  q$adjRsq=round(z$adjr2*100,2)
  q$Cp=round(z$cp,2)
  return(q)
}
ShowSubsets(all)
boxplot(example3$TrackTemp)
WeatherTotal<-rbind(TT1_1,TT1_2,TT1_3,TT2_1,TT2_2,TT2_3,TT3_1,TT3_2,TT3_3)
Monze<-rbind(TT1_1,TT1_2,TT1_3)
Silverstone<-rbind(TT2_1,TT2_2,TT2_3)
Spa<-rbind(TT3_1,TT3_2,TT3_3)




example4=read.csv("/Users/guaarmstrong/Downloads/example4.csv")

total<-rbind(example2,example3,example4)
regmodel=lm(TrackTemp~AirTemp+Humidity+Pressure+WindSpeed,data=total)
summary(regmodel)
plot(regmodel)

seq(1,7050,5)
#design phylosophy
Firstlap19=read.csv("/Users/guaarmstrong/Downloads/lap19 copy.csv")
Firstlap20=read.csv("/Users/guaarmstrong/Downloads/lap20 copy.csv")
var<-approx(Firstlap19$Distance,Firstlap19$Speed, xout=seq(1,7050,5))$y # warning
fir19<-data.frame(var,seq(1,7050,5))
var<-approx(Firstlap20$Distance,Firstlap20$Speed, xout=seq(1,7050,5))$y # warning
fir20<-data.frame(var,seq(1,7050,5))
fir19$designPh<-2019
fir19$circuitId<-1
fir20$designPh<-2020
fir20$circuitId<-1

library(mosaic)
#design phylosophy222
Secondlap19=read.csv("/Users/guaarmstrong/Downloads/Secondlap19 copy.csv")
Secondlap20=read.csv("/Users/guaarmstrong/Downloads/Secondlap20 copy.csv")
x <- Secondlap19$Distance
y <- Secondlap19$Speed
var<-approx(x,y, xout=seq(1,7050,5))$y # warning
sec19<-data.frame(var,seq(1,7050,5))
var<-approx(Secondlap20$Distance,Secondlap20$Speed, xout=seq(1,7050,5))$y # warning
sec20<-data.frame(var,seq(1,7050,5))
sec19$designPh<-2019
sec19$circuitId<-2
sec20$designPh<-2020
sec20$circuitId<-2
plot(var~seq(1,7050,5))


Thirdlap19=read.csv("/Users/guaarmstrong/Downloads/Thirdlap19 copy.csv")
Thirdlap20=read.csv("/Users/guaarmstrong/Downloads/Thirdlap20 copy.csv")
var<-approx(Thirdlap19$Distance,Thirdlap19$Speed, xout=seq(1,7050,5))$y # warning
thi19<-data.frame(var,seq(1,7050,5))
var<-approx(Thirdlap20$Distance,Thirdlap20$Speed, xout=seq(1,7050,5))$y # warning
thi20<-data.frame(var,seq(1,7050,5))
thi19$circuitId<-3
thi19$designPh<-2019
thi20$designPh<-2020
thi20$circuitId<-3
Forthlap19=read.csv("/Users/guaarmstrong/Downloads/Forthlap19 copy.csv")
Forthlap20=read.csv("/Users/guaarmstrong/Downloads/Forthlap20 copy.csv")
var<-approx(Forthlap19$Distance,Forthlap19$Speed, xout=seq(1,7050,5))$y # warning
for19<-data.frame(var,seq(1,7050,5))
var<-approx(Forthlap20$Distance,Forthlap20$Speed, xout=seq(1,7050,5))$y # warning
for20<-data.frame(var,seq(1,7050,5))
for19$circuitId<-4
for19$designPh<-2019
for20$designPh<-2020
for20$circuitId<-4
Fifthlap19=read.csv("/Users/guaarmstrong/Downloads/Fifthlap19 copy.csv")
Fifthlap20=read.csv("/Users/guaarmstrong/Downloads/Fifthlap20 copy.csv")
var<-approx(Fifthlap19$Distance,Fifthlap19$Speed, xout=seq(1,7050,5))$y # warning
fif19<-data.frame(var,seq(1,7050,5))
var<-approx(Fifthlap20$Distance,Fifthlap20$Speed, xout=seq(1,7050,5))$y # warning
fif20<-data.frame(var,seq(1,7050,5))
fif19$circuitId<-5
fif19$designPh<-2019
fif20$designPh<-2020
fif20$circuitId<-5
Sixthlap19=read.csv("/Users/guaarmstrong/Downloads/Sixthlap19 copy.csv")
Sixthlap20=read.csv("/Users/guaarmstrong/Downloads/Sixthlap20 copy.csv")
var<-approx(Sixthlap19$Distance,Sixthlap19$Speed, xout=seq(1,7050,5))$y # warning
six19<-data.frame(var,seq(1,7050,5))
var<-approx(Sixthlap20$Distance,Sixthlap20$Speed, xout=seq(1,7050,5))$y # warning
six20<-data.frame(var,seq(1,7050,5))
six19$circuitId<-6
six19$designPh<-2019
six20$designPh<-2020
six20$circuitId<-6



designPh_total<-rbind(fir19,fir20,sec19,sec20,thi19,thi20,for19,for20,fif19,fif20,six19,six20)
plot(Speed~Distance,type="l",col=designPh,data=designPh_total)
regmodelDesignPh=aov(var~as.factor(designPh)+as.factor(circuitId)+as.factor(seq.1..7050..5.),use="complete.obs",data=designPh_total)
regmodelDesignPh=lm(sqrt(var)~as.factor(designPh)+as.factor(circuitId)+as.factor(seq.1..7050..5.),use="complete.obs",data=designPh_total)
ggcoef(head(broom::tidy(regmodelDesignPh, conf.int = TRUE), 2))
summary(regmodelDesignPh)
anova(regmodelDesignPh)
model.tables(regmodelDesignPh,"means")
TukeyHSD(regmodelDesignPh)
plot(TukeyHSD(regmodelDesignPh))
plot(regmodelDesignPh)
qqnorm(regmodelDesignPh$residuals)

set.seed(0)
library(boot)

#define function to calculate R-squared
rsq_function <- function(formula, data, indices) {
  d <- data[indices,] #allows boot to select sample
  fit <- lm(formula, data=d) #fit regression model
  return(summary(fit)$r.square) #return R-squared of model
}
#perform bootstrapping with 2000 replications
reps <- boot(data=designPh_total, statistic=rsq_function, R=200, formula=(var~as.factor(designPh)+as.factor(circuitId)+as.factor(seq.1..7050..5.)))

#view results of boostrapping
reps
plot(reps)




##pit~year
pitStops=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/pit_stops.csv")
races=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/races.csv")
pitStops_total<-merge(pitStops,races,by="raceId",all.x=T)
#find Q1, Q3, and interquartile range for values in column A
Q1 <- quantile(pitStops_total$milliseconds, .25)
Q3 <- quantile(pitStops_total$milliseconds, .75)
IQR <- IQR(pitStops_total$milliseconds)

#only keep rows in dataframe that have values within 1.5*IQR of Q1 and Q3
no_outliers <- subset(pitStops_total, pitStops_total$milliseconds> (Q1 - 1.5*IQR) & pitStops_total$milliseconds< (Q3 + 1.5*IQR))

#view row and column count of new data frame
dim(no_outliers) 
regmodel_pit=lm(milliseconds~year+as.factor(circuitId)+as.factor(driverId),data=no_outliers,use="complete.obs")
summary(regmodel_pit)
TukeyHSD(regmodel_pit)
plot(TukeyHSD(regmodel_pit))
plot(regmodel_pit)
qqnorm(regmodel_pit$residuals)
plot(no_outliers$milliseconds~no_outliers$year)
boxplot(milliseconds~year,data=no_outliers)
plot(no_outliers,aes(x=year,y=milliseconds,group=circuitId,color=circuitId)) + geom_point(size = 0.1, shape = 8)


monacoPits<-subset(no_outliers,circuitId==7)
regmodel_pit2=aov(milliseconds~year+as.factor(driverId),data=monacoPits)
summary(regmodel_pit2)
plot(regmodel_pit2)
qqnorm(regmodel_pit2$residuals)

pitStops=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/pit_stops.csv")
results=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/results.csv")
pitStopsandPionts_total<-merge(pitStops,results,by="mergeId",all.x=T)
pitStopsandPionts_total<-subset(pitStopsandPionts_total,position!="\n"&position!="R")
pitStopsandPionts_total$position<-as.numeric(pitStopsandPionts_total$position)
regmodel_pitStopsandPionts=lm(position~as.factor(circuitId.x)+as.factor(raceId.x)+as.factor(driverId.x)+as.factor(stop):milliseconds+milliseconds,data=pitStopsandPionts_total,use="complete.obs")
summary(regmodel_pitStopsandPionts)
plot(regmodel_pitStopsandPionts)

set.seed(0)
library(boot)

#define function to calculate R-squared
rsq_function <- function(formula, data, indices) {
  d <- data[indices,] #allows boot to select sample
  fit <- lm(formula, data=d) #fit regression model
  return(summary(fit)$r.square) #return R-squared of model
}
#perform bootstrapping with 2000 replications
reps <- boot(data=pitStopsandPionts_total, statistic=rsq_function, R=2000, formula=position~as.factor(raceId.x)+as.factor(driverId.x)+as.factor(stop):milliseconds+milliseconds)

#view results of boostrapping
reps
plot(reps)




#lead
#whether leading the race may affect the speed of the car
lapTimes=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/lap_times.csv")
lapTimes$lead<-ifelse(lapTimes$position==1,1,0)
#find Q1, Q3, and interquartile range for values in column A
Q1 <- quantile(lapTimes$milliseconds, .25)
Q3 <- quantile(lapTimes$milliseconds, .75)
IQR <- IQR(lapTimes$milliseconds)

#only keep rows in dataframe that have values within 1.5*IQR of Q1 and Q3
no_outliers <- subset(lapTimes, lapTimes$milliseconds> (Q1 - 1.5*IQR) & lapTimes$milliseconds< (Q3 + 1.5*IQR))

#view row and column count of new data frame
dim(no_outliers) 
regmodelLead=aov(milliseconds~as.factor(driverId)+as.factor(raceId)+lead,data=no_outliers)
#regmodelLead=aov(milliseconds~as.factor(driverId)+as.factor(raceId)+lead+as.factor(driverId)*lead,data=no_outliers)
summary(regmodelLead)
plot(regmodelLead)

races=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/races.csv")
lead_total<-merge(lapTimes,races,by="raceId",all.x=T)
regmodelLead=aov(milliseconds~as.factor(driverId)+as.factor(raceId)+as.factor(circuitId)+lead,data=lead_total)
#regmodelLead=aov(milliseconds~as.factor(driverId)+as.factor(raceId)+lead+as.factor(driverId)*lead,data=no_outliers)
summary(regmodelLead)
plot(regmodelLead)




#Q3~year(trend of F1's speed change)
lapTimes=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/qualifying3.csv")
races=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/races.csv")
rawSpeed_total<-merge(lapTimes,races,by="raceId",all.x=T)
regmodelSpeedTrend=aov(q3Seconds~as.factor(circuitId)+as.factor(driverId)+year,data=rawSpeed_total,use="complete.obs")
summary(regmodelTimeSeries)
plot(q3Seconds~year,col=circuitId,data=rawSpeed_total)
plot(mean(q3Seconds)~year,data=rawSpeed_total)
boxplot(q3Seconds~year, data=rawSpeed_total)

regmodelTimeSeries=lm(q3Seconds~year,data=rawSpeed_total)
summary(regmodelTimeSeries)
plot(q3Seconds~year, data=MonacoQ3)

MonacoQ3<-subset(rawSpeed_total,circuitId==6)
MonacoQ3$time<-as.numeric(MonacoQ3$q3Seconds)
MonacoQ3<-subset(MonacoQ3,MonacoQ3$time!="NA")
MonacoQ3<-subset(MonacoQ3,MonacoQ3$time!=0)
regmodelMonacoQ3=lm(q3Seconds~year,data=MonacoQ3,use="complete.obs")
summary(regmodelMonacoQ3)
boxplot(time~year, data=MonacoQ3)
plot(time~year, data=MonacoQ3)

#driver Id counted in the previous model
lapTimes=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/quali.csv")
races=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/races.csv")
rawSpeed_total<-merge(lapTimes,races,by="raceId",all.x=T)
regmodelTimeSeries=aov(q3Seconds~as.factor(circuitId)+as.factor(driverId)+year,data=rawSpeed_total,use="complete.obs")
summary(regmodelTimeSeries)
plot(regmodelTimeSeries)



#whether there is a difference in drivers
qualifying=read.csv("/Users/guaarmstrong/Downloads/f1db_csv_2/qualifying.csv") #get all the qualifying Q3 data
rawSpeed_total2<-merge(qualifying,races,by="raceId",all.x=T)
MonacoQ3RawSpeed<-subset(rawSpeed_total2,circuitId==6) #get the qualifying Q3 data in monaco
MonacoQ3RawSpeedReal<-subset(MonacoQ3RawSpeed,q3Seconds!="#VALUE!") #get complete data
MonacoQ3RawSpeedReal$q3Seconds<-as.numeric(MonacoQ3RawSpeedReal$q3Seconds)
MonacoQ3RawSpeedReal<-subset(MonacoQ3RawSpeedReal,q3Seconds!=0.00) #get complete data
regmodelDiffDriver=lm(q3Seconds~year+as.factor(driverId)+as.factor(constructorId)+as.factor(driverId):as.factor(constructorId)+as.factor(circuitId),data=no_outliers,use="complete.obs")
summary(regmodelDiffDriver)
aov(regmodelDiffDriver)
plot(regmodelDiffDriver)

library(mosaic)

set.seed(0)
library(boot)

#define function to calculate R-squared
rsq_function <- function(formula, data, indices) {
  d <- data[indices,] #allows boot to select sample
  fit <- lm(formula, data=d) #fit regression model
  return(summary(fit)$r.square) #return R-squared of model
}
#perform bootstrapping with 2000 replications
reps <- boot(data=no_outliers, statistic=rsq_function, R=2000, formula=q3Seconds~year+as.factor(driverId)+as.factor(constructorId))

#view results of boostrapping
reps
plot(reps)

lapTimes=read.csv("/Users/guaarmstrong/Downloads/f1db_csv_2/qualifying.csv")
races=read.csv("/Users/guaarmstrong/Downloads/f1db_csv/races.csv")
rawSpeed_total<-merge(lapTimes,races,by="raceId",all.x=T)
rawSpeed_total$Q1_seconds<-as.numeric(rawSpeed_total$q3Seconds)
rawSpeed_total10<-subset(rawSpeed_total,rawSpeed_total$Q1_seconds!="NA")
rawSpeed_total10<-subset(rawSpeed_total10,rawSpeed_total$year!=2022)
#get rid of outliers
Q1 <- quantile(rawSpeed_total10$Q1_seconds, .25)
Q3 <- quantile(rawSpeed_total10$Q1_seconds, .75)
IQR <- IQR(rawSpeed_total10$Q1_seconds)
no_outliers <- subset(rawSpeed_total10, rawSpeed_total10$Q1_seconds> (Q1 - 1.5*IQR) & rawSpeed_total10$Q1_seconds< (Q3 + 1.5*IQR))
#no_outliers<-subset(no_outliers,circuitId==6)
no_outliers$rule<-ifelse(no_outliers$year==1998&is.na(no_outliers$year),1,NA)
no_outliers$rule<-ifelse(no_outliers$year==1999&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2000&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2001&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2002&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2003&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2004&is.na(no_outliers$year),2,NA)
no_outliers$rule<-ifelse(no_outliers$year==2005&is.na(no_outliers$year),3,NA)
no_outliers$rule<-ifelse(no_outliers$year==2006&is.na(no_outliers$year),3,NA)
no_outliers$rule<-ifelse(no_outliers$year==2007&is.na(no_outliers$year),3,NA)
no_outliers$rule<-ifelse(no_outliers$year==2008&is.na(no_outliers$year),3,NA)
no_outliers$rule<-ifelse(no_outliers$year==2009&is.na(no_outliers$year),4,NA)
no_outliers$rule<-ifelse(no_outliers$year==2010&is.na(no_outliers$year),4,NA)
no_outliers$rule<-ifelse(no_outliers$year==2011&is.na(no_outliers$year),5,NA)
no_outliers$rule<-ifelse(no_outliers$year==2012&is.na(no_outliers$year),5,NA)
no_outliers$rule<-ifelse(no_outliers$year==2013&is.na(no_outliers$year),5,NA)
no_outliers$rule<-ifelse(no_outliers$year==2014&is.na(no_outliers$year),6,NA)
no_outliers$rule<-ifelse(no_outliers$year==2015&is.na(no_outliers$year),6,NA)
no_outliers$rule<-ifelse(no_outliers$year==2016&is.na(no_outliers$year),6,NA)
no_outliers$rule<-ifelse(no_outliers$year==2017&is.na(no_outliers$year),7,NA)
no_outliers$rule<-ifelse(no_outliers$year==2018&is.na(no_outliers$year),7,NA)
no_outliers$rule<-ifelse(no_outliers$year==2019&is.na(no_outliers$year),7,NA)
no_outliers$rule<-ifelse(no_outliers$year==2020&is.na(no_outliers$year),7,NA)
no_outliers$rule<-ifelse(no_outliers$year==2021&is.na(no_outliers$year),7,NA)
regmodelTimeSeries=aov(q3Seconds~as.factor(circuitId)+as.factor(driverId)+as.factor(year),data=no_outliers,use="complete.obs")
summary(regmodelTimeSeries)
plot(regmodelTimeSeries)




qplot(q3Seconds~year,color=rule,data=no_outliers)
boxplot(Q1_seconds~year, data=no_outliers)
regmodelSpeedChange=lm(Q1_seconds~as.factor(circuitId)+as.factor(driverId)+year, data=no_outliers)
summary(regmodelSpeedChange)
era1<-subset(no_outliers,year<2009)
era2<-subset(no_outliers,year>=2009)
era2<-subset(era2,year<2014)
era3<-subset(no_outliers,year>=2014)
era3<-subset(era3,year<2022)
plot(Q1_seconds~year,data=no_outliers)
regmodelera1=lm(Q1_seconds~as.factor(circuitId)+as.factor(driverId)+year, data=era1)
summary(regmodelera1)
boxplot(Q1_seconds~year,data=era1)
abline(regmodelera1)
regmodelera2=lm(Q1_seconds~as.factor(circuitId)+as.factor(driverId)+year, data=era2)
summary(regmodelera2)
plot(regmodelera2)
boxplot(Q1_seconds~year,data=era2)
abline(regmodelera2)
regmodelera3=lm(Q1_seconds~as.factor(circuitId)+as.factor(driverId)+year, data=era3)
summary(regmodelera3)
plot(regmodelera3)
boxplot(Q1_seconds~year,data=era3)
abline(regmodelera3)


monaco<-subset(poles,circuitId>=8)
monaco<-subset(monaco,circuitId<=10)
ggplot(monaco, aes(x=year,y=Q1_seconds,group=circuitId,color=circuitId)) + geom_point(size = 0.5, shape = 8)+geom_line(aes(group = circuitId))

poles<-subset(no_outliers,position==1)
boxplot(Q1_seconds~year,data=no_outliers)
ggplot(poles, aes(x=year,y=Q1_seconds,group=circuitId,color=circuitId)) + geom_point(size = 0.5, shape = 8)+geom_line(aes(group = circuitId))

                                                                                                                    
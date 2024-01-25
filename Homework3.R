%6.34
data("RiverIron")
require(stats); require(graphics)
summary(anscombe)

##-- now some "magic" to do the 4 regressions in a loop:
ff <- y ~ x
mods <- setNames(as.list(1:4), paste0("lm", 1:4))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  ## or   ff[[2]] <- as.name(paste0("y", i))
  ##      ff[[3]] <- as.name(paste0("x", i))
  mods[[i]] <- lmi <- lm(ff, data = anscombe)
  print(anova(lmi))
}

## See how close they are (numerically!)
sapply(mods, coef)
lapply(mods, function(fm) coef(summary(fm)))

## Now, do what you should have done in the first place: PLOTS
op <- par(mfrow = c(2, 2), mar = 0.1+c(4,4,1,1), oma =  c(0, 0, 2, 0))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = anscombe, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
}
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)
par(op)


data("Meniscus")
p <- ggplot(Meniscus, aes(x=Method, y=Stiffness))
p1 <- p + geom_dotplot(binaxis='y', stackdir='up', stackratio = 2, method="histodot",binwidth=0.01) 
p1

data("Meniscus")
AOVknee=aov(Stiffness~as.factor(Method),data=Meniscus)
summary(AOVknee)
qqnorm(AOVknee$residuals)
plot(AOVknee)
tapply(Hawks$Weight,Hawks$Species,sd)
TukeyHSD(AOVknee)

plot(TukeyHSD(AOVknee))

data(Ricci)
AOVricci=aov(Combine~as.factor(Race),data=Ricci)
summary(AOVricci)
plot(AOVricci)
TukeyHSD(AOVricci)
plot(TukeyHSD(AOVricci))


data(Hawks)
p <- ggplot(Hawks, aes(x=Species, y=Weight))
p1 <- p + geom_dotplot(binaxis='y', stackdir='up', stackratio = 0.3, method="histodot",binwidth=20) 
p1
tapply(Hawks$Weight,Hawks$Species,sd)
AOVhawks=aov(Culmen~as.factor(Species),data=Hawks)
TukeyHSD(AOVhawks)
plot(TukeyHSD(AOVhawks))

data(Alfalfa)
AOValfalfa=aov(Ht4~as.factor(Row)+as.factor(Acid),data=Alfalfa)
summary(AOValfalfa)
plot(AOValfalfa)





data("RiverIron")
AOVriveriron=aov(LogIron~as.factor(River)+as.factor(Site),data=RiverIron)
summary(AOVriveriron)

















data1<-subset(RiverIron,Site=="Upstream",data=RiverIron)

##-- now some "magic" to do the 4 regressions in a loop:
ff <- y ~ x
mods <- setNames(as.list(1:4), paste0("aov", 1:4))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  ## or   ff[[2]] <- as.name(paste0("y", i))
  ##      ff[[3]] <- as.name(paste0("x", i))
  mods[[i]] <- lmi <- aov(data1$Iron~data1$River,data=data1)
  print(anova(lmi))
}

## See how close they are (numerically!)
sapply(mods, coef)
lapply(mods, function(fm) coef(summary(fm)))

## Now, do what you should have done in the first place: PLOTS
op <- par(mfrow = c(2, 2), mar = 0.1+c(4,4,1,1), oma =  c(0, 0, 2, 0))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = data1, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
}
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)
par(op)

y<-c(1,2,3,4,5,6,7,8,9)
x<-c(1,2,3,4,5,6,7,8,9)
regmodel=lm(y~x)

library(gplots)
data("RiverIron")
y<-c(1,2,3,4,5,6,7,8,9)
x<-c(1,2,3,4,5,6,7,8,9)
regmodel=lm(y~x)
data1<-subset(RiverIron,Site=="Upstream",data=RiverIron)
AOVriveriron1=aov(Iron~as.factor(River),data=data1)
data2<-subset(RiverIron,Site=="MidStream",data=RiverIron)
AOVriveriron2=aov(Iron~as.factor(River),data=data2)
data3<-subset(RiverIron,Site=="DownStream",data=RiverIron)
AOVriveriron3=aov(Iron~as.factor(River),data=data3)
plot(AOVriveriron1$fitted.values~AOVriveriron2$fitted.values)
regmodel1=lm(AOVriveriron1$fitted.values~AOVriveriron2$fitted.values)
summary(regmodel1)
abline(regmodel1,col="blue")
abline(regmodel,col="red")
plot(AOVriveriron2$fitted.values~AOVriveriron3$fitted.values)
regmodel2=lm(AOVriveriron2$fitted.values~AOVriveriron3$fitted.values)
summary(regmodel2)
abline(regmodel2,col="blue")
abline(regmodel,col="red")
plot(AOVriveriron1$fitted.values~AOVriveriron3$fitted.values)
regmodel3=lm(AOVriveriron1$fitted.values~AOVriveriron3$fitted.values)
summary(regmodel3)
abline(regmodel3,col="blue")
abline(regmodel,col="red")

# Import the necessary packages
library(ggplot2)

# Define the data for the dog
dog_data <- data.frame(
  x = c(-100, -100, 100, 100, 0, 0, -100, 100),
  y = c(100, 0, 0, 100, 100, -100, -100, -100),
  fill = c("black", "black", "black", "black", "white", "white", "white", "white")
)

# Create the plot
ggplot(dog_data, aes(x, y, fill = fill)) +
  geom_polygon(color = "black") +
  scale_fill_identity() +
  theme_void()

x<-c(1,2,3)
y<-c(4,5,6)






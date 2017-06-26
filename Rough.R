setwd("C:/Users/YuChiehLAB/Desktop")

library(RoughSets)

dt.ex1 <- data.frame(c(1,0,2,1,1,2,2,0), c(0.5,1.2,0.1,1.2,0.4,2.2,1.1,1.5), c(2,1,0,0,2,0,1,1), c(0,2,1,2,1,1,2,1))
colnames(dt.ex1) <- c("a", "b", "c", "d")
DecTable1 <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4)


data(RoughSetData)
hiring.dt<- RoughSetData$hiring.dt

IND <- BC.IND.relation.RST(hiring.dt)
roughset <- BC.LU.approximation.RST(hiring.dt, IND)
region <- BC.positive.reg.RST(hiring.dt, roughset)
disc.Mat <- BC.discernibility.mat.RST(hiring.dt)
print(roughset)
setwd("C:/Users/YuChiehLAB/Desktop")
library(RoughSets)
ThemePark<-read.csv("Theme_park.csv")

print.by(ThemePark)
#�T�{�ݩʳ��Ofactor

ThemePark$R<-as.factor(ThemePark$R)
#�ݩ�R�ഫ��factor

DecTable_TP<-SF.asDecisionTable(dataset = ThemePark, decision.attr = 4)
#�ظm�M����

RULE_TP<-RI.AQRules.RST(DecTable_TP,confidence = 1,timesCovered = 1)
#���ͳW�h

print(RULE_TP)
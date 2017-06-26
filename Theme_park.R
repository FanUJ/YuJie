setwd("C:/Users/YuChiehLAB/Desktop")
library(RoughSets)
ThemePark<-read.csv("Theme_park.csv")

print.by(ThemePark)
#確認屬性都是factor

ThemePark$R<-as.factor(ThemePark$R)
#屬性R轉換成factor

DecTable_TP<-SF.asDecisionTable(dataset = ThemePark, decision.attr = 4)
#建置決策表

RULE_TP<-RI.AQRules.RST(DecTable_TP,confidence = 1,timesCovered = 1)
#產生規則

print(RULE_TP)

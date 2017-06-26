CutT<-dplyr::select(dt, +Credit, +Age, +AnnualIncome, +ServiceStatus)

DCutT<-SF.asDecisionTable(CutT,decision.attr = 4)

cut.T<-D.discretization.RST(DCutT, type.method = "global.discernibility")

CUTP<-SF.applyDecTable(DCutT,cut.T)

table(CUTP$Credit)
table(CUTP$Age)
table(CUTP$AnnualIncome)
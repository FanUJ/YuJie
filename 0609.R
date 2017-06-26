dt<-read_excel("Mini-Project for Interview - ½Æ»s.xlsx")

dt$ServiceStartDate=as.Date(dt$ServiceStartDate)
dt$ServiceStartDate=quarters.Date(dt$ServiceStartDate)

dt <- filter(dt, 
             !is.na(PaymentMethod), 
             !is.na(Gender), 
             Market != 'Canada-Europe-Mid East', 
             Age >=17,
             Dependents != 'Blank',
             ServiceStatus != 'Ongoing')

dt<-dplyr::select(dt,-WeeksWithService)

dt$Classification1=as.character(dt$Classification1)
dt$Classification2=as.character(dt$Classification2)

#<Supervised and Unsupervised Discretization of Continuous Features> 
CutT<-dplyr::select(dt, +Credit, +Age, +AnnualIncome, +ServiceStatus)

DCutT<-SF.asDecisionTable(CutT,decision.attr = 4)

cut.T<-D.discretization.RST(DCutT, type.method = "global.discernibility")

CUTP<-SF.applyDecTable(DCutT,cut.T)

table(CUTP$Credit)
table(CUTP$Age)
table(CUTP$AnnualIncome)


dt$Credit<-CUTP$Credit
dt$Age<-CUTP$Age
dt$AnnualIncome<-CUTP$AnnualIncome

DecTable_dt<-SF.asDecisionTable(dataset = dt,decision.attr = 15)
RULE_dt<-RI.AQRules.RST(DecTable_dt,confidence = 1,timesCovered = 1 )

options(max.print=10000)


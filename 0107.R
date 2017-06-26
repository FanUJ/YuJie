setwd("C:/Users/YuChiehLAB/Desktop")
dt=read.xlsx('Mini-Project for Interview.xlsx',sheet = 1)

dt<- filter(dt, 
               !is.na(PaymentMethod), 
               !is.na(Gender), 
               Market != 'Canada-Europe-Mid East', 
               Age >= 17,
               Dependents != 'Blank',
               ServiceStatus != 'Ongoing')

dt[,2]=as.Date(dt[,2],origin = "1899-12-30")
dt[,2]=quarters.Date(dt[,2])

dt <- dplyr::select(dt, -CustID, -WeeksWithService)


dt$Classification1<-as.character(dt$Classification1)
dt$Classification2<-as.character(dt$Classification2)

bins.credit <- bin.rpart(ServiceStatus ~ Credit, dt, n.group = 3:7)
bins.AnnualIncome <- bin.rpart(ServiceStatus ~ AnnualIncome, dt, n.group = 3:7)
bins.AnnualIncome <-bin.custom(dt$AnnualIncome, cut.p = bins.AnnualIncome$cut.points[1:3])
dt$Credit <- bins.credit$bins
dt$AnnualIncome<-bins.AnnualIncome
dt$Age <- bin.custom(dt$Age, cut.p = quantile(dt$Age, probs = (1:3 * .25)))

set.seed(12345)
ind.train <- caret::createDataPartition(dt$, p = .75, list = FALSE)


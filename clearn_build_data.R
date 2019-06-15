library("dplyr")
library("jsonlite")

all_grants <- read.csv("C:/Users/aaron/Downloads/Florida TIGER_BUILD Grants.csv") #reads in csv

all_grants <- as.data.frame(all_grants) #converts list to data frame

all_grants[,9] <- as.character(all_grants[,9]) #sets Grant Amount Column to character for easier filtering

approved_grants <- all_grants %>% filter(GrantAmount != "#N/A")

approved_grants$GrantAmount <- as.numeric(gsub("[\\$,]", "", approved_grants$GrantAmount))
approved_grants$Funding.Request <- as.numeric(gsub("[\\$,]", "", approved_grants$Funding.Request))
approved_grants$Project.Cost <- as.numeric(gsub("[\\$,]", "", approved_grants$Project.Cost))

write_json(approved_grants, "C:/Users/aaron/Downloads/approvedfloridagrants.json")

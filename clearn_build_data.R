library("dplyr")
library("jsonlite")

all_grants <- read.csv("C:/Users/aaron/Downloads/Florida TIGER_BUILD Grants.csv") #reads in csv

all_grants <- as.data.frame(all_grants) #converts list to data frame

all_grants[,9] <- as.character(all_grants[,9]) #sets Grant Amount Column to character for easier filtering

all_grants[,2] <- as.integer(all_grants[,2])

approved_grants <- all_grants %>% filter(GrantAmount != "#N/A")

approved_grants$GrantAmount <- as.numeric(gsub("[\\$,]", "", approved_grants$GrantAmount))
approved_grants$Funding.Request <- as.numeric(gsub("[\\$,]", "", approved_grants$Funding.Request))
approved_grants$Project.Cost <- as.numeric(gsub("[\\$,]", "", approved_grants$Project.Cost))


project_type_order <- c("Road", "Maritime", "Freight Rail", "Transit", "Bicycle and Pedestrian")
approved_grants$Project.Type <- factor(approved_grants$Project.Type, levels = c("Road", "Maritime", "Freight Rail", "Transit", "Bicycle and Pedestrian")) #Changes to factor for easier sorting



approved_grants <- arrange(approved_grants, approved_grants$Year, approved_grants$Project.Type) #sorts by year and project type

approved_grants[0,2]

approved_grants[2,"GrantAmount"]

old_year <- 2009
year_total <- 0

for (row in 1:nrow(approved_grants)){ ##sets bar total to make assembling the d3 chart easier
  year <- approved_grants[row,2]
  if (year == old_year){
    approved_grants[row, "barTotal"] <- year_total + approved_grants[row,9]
    year_total <- year_total + approved_grants[row,9]
  }
  else {
    approved_grants[row, "barTotal"] <- approved_grants[row,9]
    year_total <- approved_grants[row,9]
  }
  old_year <- year
}


write_json(approved_grants, "C:/Users/aaron/Downloads/approvedfloridagrants.json")

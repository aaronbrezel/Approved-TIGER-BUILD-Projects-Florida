library("dplyr")
library("jsonlite")

#all_grants <- read.csv("C:/Users/aaron/Downloads/Florida TIGER_BUILD Grants.csv") #reads in csv

all_grants <- read.csv("C:/Users/abrezel/Documents/GitHub/Approved-TIGER-BUILD-Projects-Florida/Florida TIGER_BUILD Grants.csv")


all_grants <- as.data.frame(all_grants) #converts list to data frame

all_grants[,9] <- as.character(all_grants[,9]) #sets Grant Amount Column to character for easier filtering

all_grants[,2] <- as.integer(all_grants[,2])

approved_grants <- all_grants %>% filter(GrantAmount != "#N/A")

lat <- c(28.537971, 25.908644, 27.636500, 30.398273, 26.637771, 26.12367, 27.947055, 26.330512, 26.350433, 25.764509, 25.888879, 26.1849, 26.410578, 25.584623, 30.328843)								
long <- c(-81.391789, -80.162601, -82.554475, -81.566218, -81.031757, -80.143261, -82.459609, -81.805777, -80.08801, -80.368607, -80.513306, -80.2296, -81.416571, -80.373677, -81.658669)

approved_grants$latitude <- lat
approved_grants$longitude <- long

approved_grants$GrantAmount <- as.numeric(gsub("[\\$,]", "", approved_grants$GrantAmount))
approved_grants$Funding.Request <- as.numeric(gsub("[\\$,]", "", approved_grants$Funding.Request))
approved_grants$Project.Cost <- as.numeric(gsub("[\\$,]", "", approved_grants$Project.Cost))


project_type_order <- c("Road", "Maritime", "Freight Rail", "Transit", "Bicycle and Pedestrian")
approved_grants$Project.Type <- factor(approved_grants$Project.Type, levels = c("Road", "Maritime", "Freight Rail", "Transit", "Bicycle and Pedestrian")) #Changes to factor for easier sorting



approved_grants <- arrange(approved_grants, approved_grants$Year, approved_grants$Project.Type) #sorts by year and project type


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


write_json(approved_grants, "C:/Users/aaron/OneDrive/Documents/Miami Herald/TIGERBUILDFlorida/approvedfloridagrants.json")



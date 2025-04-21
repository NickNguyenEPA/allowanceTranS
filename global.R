#Short list of packages for posit connect limit
packages <- c("shiny", "ggplot2", "dplyr", "readr", "shinyWidgets")

# Install packages not yet installed
install.packages(packages[!(packages %in% rownames(installed.packages()))], repos = "http://cran.us.r-project.org")

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

#load data
load("./data/allowanceTransaction/allowTrans.RData")

#min and max for date range input value
min_date <- min(allowTrans$transactionDate, na.rm = TRUE)
max_date <- max(allowTrans$transactionDate, na.rm = TRUE)


#convert as.Ddate for transaction date

current_date <- Sys.Date()


#prepare for API call
apiKEY <- read_lines("./data/apiKey/api_key.txt")

apiUrlBase <- "https://api.epa.gov/easey"

allowanceUrl <- paste0(apiUrlBase,"/streaming-services/allowance-transactions?API_KEY=",apiKEY)




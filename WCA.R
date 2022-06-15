#FoodInsecurity data
  
#FoodInsecure: is the food security status of the individual, value 0 if the individual is food secure and 1 if she/he is food insecure
#Age: age of the individual, continuous variable.
#Sex: sex of the individual, discrete variable with 2 levels “female”, and “male”.
#Education: maximum education level attained by the individual with 3 levels “primary”, “secondary” and “tertiary”.
#EmploymentStatus: employment status of the individual, discrete variable with 2 levels “employed”, and “unemployed”.
#Region: region in which the individual lives, discrete variable with 10 levels “1”, “2“,…, “10”.
#PhoneAccess: discrete variable with 2 levels, “1” if the individual has access to a phone and “2” if she/he does not.
#Using R to perform the following:
#Fit a logistic regression to model the food security status of the individual on the other variables. 
#Please present the model output. Briefly discuss and motivate the choice of this model and indicate whether an alternative approach could be adopted.
#Which variables are significant at the 95% significance level? Please justify your answer.
#Please provide a short interpretation of the model results.

#install packages
install.packages("tidyverse")
library(tidyverse)
install.packages("janitor")
library(janitor)
install.packages("writexl")
library(writexl)


#Load data 
foodinsecure <- readxl::read_xlsx("FoodInsecurity.xlsx")
#how  many unique values we have in each column using sapply
sapply(foodinsecure, function(x) (unique(x)))
#detecting string in a column using grep
try <- Faostat[grep("the census covered both ", Faostat$Note), ]
try <- Faostat[grep(">=", Faostat$Note), ]
fao <-read.csv("FAOSTAT_data_2-14-2022.csv")
try <- fao[grep(">=", fao$Note), ]
View(try)
#__________________________________________________________
data <- surveydata
survey <- data %>% select(-c(CollectorNm,RespondentID,
                               CollectorID,StartDate, EndDate,IPAddress,
                               FirstName,LastName,
                               CustomData1,language)) %>% 
 remove_empty("cols")

splitsurvey <- sapply(c("q0001","q0002", "q0003", "q0004",
                        "q0005", "q0006",  "q0007",  "q0008", 
         "q0009",  "q0010",  "q0011",  "q0012",  "q0013",  "q0014",  "q0019"), 
       function(x) survey[startsWith(names(survey),x)],
       simplify = FALSE)
q1_3 <- splitsurvey[c(1:3)]
q1.3 <- as.data.frame(q1_3)
view(q1.3)
#________________________________________________________________






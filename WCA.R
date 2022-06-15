#Data processing of the WCA 2020 update survey through survey monkey. 
#The survey comprises of 19 questions with questions and was sent 183 countries.
#Responses received from country were processed using the code below:

#the following packages were used for processing this data
install.packages("tidyverse")
library(tidyverse)
install.packages("janitor")
library(janitor)
install.packages("writexl")
library(writexl)
install.packages("tidyxl")
library(tidyxl)

#import the dataset using xlsx_cells function from the tidyxl package and using
#the behead function to clean the data and arrange it in a long format
onlinesurvey <- xlsx_cells("survey.xlsx")%>% 
  behead("up-left", "questions") %>% 
  behead("up-left", "items") %>% 
  behead("left", "country") %>% 
  # behead("left", "response") %>% 
  select(character, questions, items, country) %>% 
  select(4,2,3,1)

#the function colnames was used to assign column headers to the new processed dataset
colnames(onlinesurvey) <- c("country","questions", "items", "responses")

#to extract each processed question from 1 to 19 from the processed dataset and paste 
#them in different excelsheets of an excel file, a for loop was written facilitate this operation
ids <- unique(onlinesurvey$questions)
for(i in 1:length(ids)){
  id <- ids[i]
  question <- data.frame(onlinesurvey[onlinesurvey$questions == id, ])
  assign(paste("question", i, sep="."), question)
  # or alternatively, if you wanted the data.frames to be assigned by id, 
  # assign(id, mini.df)
}
sheet <- list("Anyotherinformation"=question,
              "Q2"=question.1,
              "Q3"=question.2,
              "Q4"=question.3,
              "Q5"=question.4,
              "Q6"=question.5,
              "Q7"=question.6,
              "Q8"=question.7,
              "Q9"=question.8,
              "Q10"=question.9,
              "Q11"=question.10,
              "Q12"=question.11,
              "Q13"=question.12,
              "Q14"=question.13,
              "Q15"=question.14,
              "Q16"=question.15,
              "Q17"=question.16,
              "Q18"=question.17,
              "Q19"=question.18)
write_xlsx(sheet, "test.xlsx")

#__________________________________________________________
#data <- surveydata
#survey <- data %>% select(-c(CollectorNm,RespondentID,
#                               CollectorID,StartDate, EndDate,IPAddress,
#                              FirstName,LastName,
#                             CustomData1,language)) %>% 
#remove_empty("cols")

#splitsurvey <- sapply(c("q0001","q0002", "q0003", "q0004",
#                        "q0005", "q0006",  "q0007",  "q0008", 
#         "q0009",  "q0010",  "q0011",  "q0012",  "q0013",  "q0014",  "q0019"), 
#       function(x) survey[startsWith(names(survey),x)],
#       simplify = FALSE)
#q1_3 <- splitsurvey[c(1:3)]
#q1.3 <- as.data.frame(q1_3)
#view(q1.3)
#________________________________________________________________





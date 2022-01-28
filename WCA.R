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

#Load data 
foodinsecure <- readxl::read_xlsx("FoodInsecurity.xlsx")
#how  many unique values we have in each column using sapply
sapply(foodinsecure, function(x) (unique(x)))


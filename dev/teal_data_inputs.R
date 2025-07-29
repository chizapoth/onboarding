# understand what are typical data inputs for teal app



# install.packages('random.cdisc.data')

# creating random cdisc data 
library(random.cdisc.data)

?radsl

# ADSL ----
# subject-level analysis dataset
# create 10 patients

adsl <- radsl(N = 10, 
              study_duration = 2, 
              seed = 1)
adsl

# check the colnames
colnames(adsl)


# ADAE ----
# adverse event

adae <- radae(adsl, seed = 2)
head(adae)

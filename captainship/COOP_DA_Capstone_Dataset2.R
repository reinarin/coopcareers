require(tidyverse)
require(cleaner)

myFun <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

userid <- myFun(394)
userid <- data.frame(userid)

gender <- unlist(list(sample(0:2, size = 394, replace = T)))
gender <- data.frame(gender)

age <- unlist(list(sample(18:70, size = 394, replace = T)))
age <- data.frame(age)

income <- unlist(list(sample(40000:150000, size = 394, replace = T)))
income <- data.frame(income)

education_level <- unlist(list(sample(0:2, size = 394, replace = T)))
education_level <- data.frame(education_level)

occupation <- unlist(list(sample(0:2, size = 394, replace = T)))
occupation <- data.frame(occupation)
occupation <- occupation %>%
  mutate(occupation = case_when(
    occupation == 0 ~ "Laborer",
    occupation == 1 ~ "Self-Employed",
    occupation == 2 ~ "Homemaker",
  ))

for (i in 1:394) {
  if (education_level$education_level[i] == 0){
    occupation$occupation[i] <- "Unemployed"
    } else if (age$age[i] > 65){
      occupation$occupation[i] <- "Retired"
      } else if (age$age[i] <= 21){
        occupation$occupation[i] <- "Student"
      }
  }

marital_status <- unlist(list(sample(0:3, size = 394, replace = T)))
marital_status <- data.frame(marital_status)

family_size <- unlist(list(sample(0:2, size = 394, replace = T)))
family_size <- data.frame(family_size)

country <- rep("USA", 394)
country <- data.frame(country)

state <- data.frame(unlist(list(sample(state.name, size = 394, replace = T))))
colnames(state) <- "state"

region <- state %>%
  mutate(region = case_when(
    state == "Connecticut" ~ "Northeast",
    state == "Maine" ~ "Northeast",
    state == "Massachusetts" ~ "Northeast",
    state == "New Hampshire" ~ "Northeast",
    state == "Rhode Island" ~ "Northeast",
    state == "Vermont" ~ "Northeast",
    state == "New Jersey" ~ "Northeast",
    state == "New York" ~ "Northeast",
    state == "Pennsylvania" ~ "Northeast",
    state == "Indiana" ~ "Midwest",
    state == "Illinois" ~ "Midwest",
    state == "Michigan" ~ "Midwest",
    state == "Ohio" ~ "Midwest",
    state == "Wisconsin" ~ "Midwest",
    state == "Iowa" ~ "Midwest",
    state == "Kansas" ~ "Midwest",
    state == "Minnesota" ~ "Midwest",
    state == "Missouri" ~ "Midwest",
    state == "Nebraska" ~ "Midwest",
    state == "North Dakota" ~ "Midwest",
    state == "South Dakota" ~ "Midwest",
    state == "Delaware" ~ "South",
    state == "District of Columbia" ~ "South",
    state == "Florida" ~ "South",
    state == "Georgia" ~ "South",
    state == "Maryland" ~ "South",
    state == "North Carolina" ~ "South",
    state == "South Carolina" ~ "South",
    state == "Virginia" ~ "South",
    state == "West Virginia" ~ "South",
    state == "Alabama" ~ "South",
    state == "Kentucky" ~ "South",
    state == "Mississippi" ~ "South",
    state == "Tennessee" ~ "South",
    state == "Arkansas" ~ "South",
    state == "Louisiana" ~ "South",
    state == "Oklahoma" ~ "South",
    state == "Texas" ~ "South",
    state == "Arizona" ~ "West",
    state == "Colorado" ~ "West",
    state == "Idaho" ~ "West",
    state == "New Mexico" ~ "West",
    state == "Montana" ~ "West",
    state == "Utah" ~ "West",
    state == "Nevada" ~ "West",
    state == "Wyoming" ~ "West",
    state == "Alaska" ~ "West",
    state == "California" ~ "West",
    state == "Hawaii" ~ "West",
    state == "Oregon" ~ "West",
    state == "Washington" ~ "West"
  ))

urbanicity <- unlist(list(sample(0:2, size = 394, replace = T)))
urbanicity <- data.frame(urbanicity)

#ad_view_date <- data.frame(rdate(729, min = paste0("2024-09-01"), max = paste("2025-03-31")))
#colnames(ad_view_date) <- "ad_view_date"

dataset2 <- cbind(userid, gender, age, income, education_level, occupation, marital_status, family_size, country, region, urbanicity)

dataset2$row_num <- seq.int(nrow(dataset2))

write.csv(dataset2, "FA25_COOP_DA_Capstone_Dataset_2.csv", row.names = F)

rm('age', 'country', 'education_level', 'family_size', 'gender', 'income', 'marital_status', 'occupation', 'region', 'state', 'urbanicity', 'userid')

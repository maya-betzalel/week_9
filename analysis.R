#### CREATE DF ----

# Set seed for reproducibility
set.seed(123)

# Variables
participant_id <- 1:100
age <- round(rnorm(100, mean = 35, sd = 10))
age[age < 18] <- 18  # Ensure minimum age is 18
gender <- sample(c("Male", "Female"), 100, replace = TRUE)
mean_reaction_time <- round(rnorm(100, mean = 1500, sd = 500))
mean_reaction_time[mean_reaction_time < 200] <- 200  # Minimum reaction time is 200ms
depression <- sample(0:100, 100, replace = TRUE)
average_sleep <- rnorm(100, mean = 7, sd = 1.5)
average_sleep[average_sleep < 2] <- 2  # Minimum sleep time is 2 hours

# Create data frame
analysis <- data.frame(
  participant_id,
  age,
  gender,
  mean_reaction_time,
  depression,
  average_sleep
)

# Display first rows
head(analysis)

# Save to file
write.csv(analysis, "analysis_normalized.csv", row.names = FALSE)

#### USE FUNCTION ----

# Load the function from "functions.R"
source("C:/Users/maya3/OneDrive/Desktop/TAU/תואר שני/Introduction to R/מטלות/week9/functions.R")

# Use the function to calculate descriptive statistics
results <- create_descriptive_stats(analysis)

# Print the results
print(results)

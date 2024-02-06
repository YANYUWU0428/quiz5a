install.packages("usethis")
library(usethis)
create_github_token()

install.packages("gitcreds")
library(gitcreds)
gitcreds_set()

install.packages("tidyverse")

# Step 1: Generate Independent Readings
set.seed(123) # For reproducibility
days <- 100
mean_pages <- 50
std_dev_pages <- 15

# Generate random readings for Matt, Jacki, Rol, and Mike
matt <- rnorm(days, mean_pages, std_dev_pages)
jacki <- rnorm(days, mean_pages, std_dev_pages)
rol <- rnorm(days, mean_pages, std_dev_pages)
mike <- rnorm(days, mean_pages, std_dev_pages)

# Step 2: Generate Correlated Readings for Ash (correlated with Matt)
correlation_factor <- 0.5
ash <- matt * correlation_factor + rnorm(days, mean_pages * (1 - correlation_factor), std_dev_pages)

# Step 3: Combine into a data frame
install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)

data <- data.frame(Day = 1:days, Matt = matt, Ash = ash, Jacki = jacki, Rol = rol, Mike = mike)
long_data <- data %>% pivot_longer(-Day, names_to = "Person", values_to = "Pages")

# Step 4: Sketch the Graph
install.packages("ggplot2")
library(ggplot2)

ggplot(long_data, aes(x = Day, y = Pages, color = Person)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Daily Pages Read by Each Undergraduate Over 100 Days",
       x = "Day",
       y = "Pages Read")


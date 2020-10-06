# ==================================================================
# Weekend Project 
# ------------------------------------------------------------------
# Pick a dataset that is not clean and 
# work on it until it is tidy then
# perform EDA on it
# ==================================================================
# Dataset source:
# https://github.com/RMHogervorst/unicorns_on_unicycles
# ==================================================================

# Install packages
#install.packages("tidyverse")
#install.packages("readxl")

# Load packages
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)

# import first dataframe
# from: https://github.com/RMHogervorst/unicorns_on_unicycles/blob/master/observations.xlsx
observations <- read_excel("observations.xlsx")
View(observations)

# import second dataframe
# from: https://github.com/RMHogervorst/unicorns_on_unicycles/blob/master/sales.xlsx
sales <- read_excel("sales.xlsx")
View(sales)

# ===================================================================
# 1/ tidy and merge data
# ===================================================================

# ------------------ operations on first dataframe ------------------ 

# rename column to 'country' for uniformity
observations <- rename(observations, country = countryname)

# make letters uppercase to match with second dataframe
observations <- observations %>% 
    mutate(country = toupper(country))

# ------------------ operations on second dataframe ----------------- 

# rename column to 'country' for uniformity 
sales <- rename(sales, country = name_of_country...1)

# rename column to 'year' for uniformity 
sales <- rename(sales, year = year...2)

# remove empty columns
sales <- select(sales,-c(...4,...5))

# detect duplicate columns
as.logical(duplicated(as.list(sales), fromLast=FALSE) + 
               duplicated(as.list(sales), fromLast=TRUE))

# remove said duplicate columns
sales <- select(sales,-c(name_of_country...6, year...7))

# ------------------------------------------------------------------

# left join dataframes 
merged_df <- merge(x = observations, y = sales, 
                   by = c("year","country"), 
                   all.x = TRUE,
                   sort = TRUE)
names(merged_df)
view(merged_df)

# registered observations per country? (sum=42)
table(merged_df$country)

# ===================================================================
# 2/ perform EDA
# ===================================================================
# Generate questions about your data.
# Search for answers by visualizing, transforming, and modeling your data.
# Use what you learn to refine your questions and/or generate new questions.

# Q. is there a relation between observations of unicorns and sales of bikes?

ggplot(data = merged_df) + 
    geom_point(aes(x = year, y = pop, color = country)) +
    geom_line(aes(x = year, y = bikes, color = country))

# volume of bikes and unicorns are different yet it seems there is
# a pattern when looking at countries with the highest values

# plot relationship between bikes and pop in each country (using facets)
ggplot(data = merged_df, aes(x = pop, y = bikes)) + 
    geom_point(aes(alpha = 0.8, color = country, size = 1), show.legend = FALSE) + 
    facet_wrap(~ country)

# it appears there is a linear relationship between 
# number of unicorns observed and sales of bikes 
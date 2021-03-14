library(r2d3)
library(data.table)
library(dplyr)
library(rlist)
source("https://raw.githubusercontent.com/JohnnyPeng123/hierarchical_bar_chart-/master/hbar.r")

# Read in sample data file
data <- setDT(read.csv("https://raw.githubusercontent.com/JohnnyPeng123/hierarchical_bar_chart-/master/aug_train.csv"))
data$target <- ifelse(data$target==1,"Looking for a job","Not looking for a job")

# Specify the hierarchical relationship
groupings <- c("target","last_new_job","relevent_experience","education_level")

# Generate and view the hierarchical bar chart
chart <- hbar(data,groupings,method="count",num_variable=NULL,na.rm=T)
chart


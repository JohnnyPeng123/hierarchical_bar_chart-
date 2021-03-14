library(r2d3)
library(data.table)
library(dplyr)
library(rlist)
source("https://raw.githubusercontent.com/JohnnyPeng123/hierarchical_bar_chart-/master/hbar.r")

data <- setDT(read.csv("C:\\Users\\woshi\\Desktop\\hbarchart\\aug_train.csv"))
data$target <- ifelse(data$target==1,"Looking for a job","Not looking for a job")

# Group data by specified groupings
groupings <- c("target","last_new_job","relevent_experience","education_level")
chart <- hbar(data,groupings,method="count",num_variable=NULL,na.rm=T)
chart


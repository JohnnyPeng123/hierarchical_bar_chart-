library(r2d3)
library(data.table)
library(dplyr)
library(rlist)

setwd("C:\\Users\\woshi\\Desktop\\hbarchart")

data_test <- read.csv("aug_train.csv")
data <- setDT(data_test)
data$target <- ifelse(data$target==1,"Looking for a job","Not looking for a job")

# Group data by specified groupings
groupings <- c("target","last_new_job","relevent_experience","education_level")

chart <- hbar(data,groupings,method="mean",num_variable="training_hours",na.rm=T)

hbar <- function(data,groupings,method,num_variable=NULL,na.rm=T){
        
        if (method == "count") {
            data_agg <- data %>% group_by(.dots = groupings) %>% summarise(count = n()) %>% data.table() 
      } else if (method == "sum" & !is.null(num_variable)) {
            data_agg <- data %>% group_by(.dots = groupings) %>% summarise(sum = sum(!!sym(num_variable)),na.rm=na.rm) %>% data.table()
      } else if (method == "mean" & !is.null(num_variable)) {
            data_agg <- data %>% group_by(.dots = groupings) %>% summarise(mean = mean(!!sym(num_variable)),na.rm=na.rm) %>% data.table()
      }
  
        output <- list()
        output$name <- "data"
  
        for (var in 1:length(groupings)){
          eval(parse(text=paste0("data_agg[,'syntax",var,"']<-NA")))
          for (children in 1:length(unique(unlist(data_agg[,..var])))){
                eval(parse(text=paste0(
                     "data_agg[,'syntax_temp']<-rep(unique(data_agg[,",var,"])[",children,"],nrow(data_agg))"
                )))
                eval(parse(text=paste0(
                  "data_agg[,'syntax",var,"']","<-ifelse(data_agg[,",var,"]==data_agg[,'syntax_temp'],'$children[[",children,"]]',unlist(data_agg[,'syntax",var,"']))"
                )))
          }
          if (var > 1) {
            eval(parse(text=paste0(
              "data_agg[,'syntax",var,"']<-paste0(","unlist(data_agg[,'syntax",var-1,"']),unlist(data_agg[,'syntax",var,"']))"
            )))
          }
      
          eval(parse(text=paste0(
            "names <- unique(data_agg[,c('syntax",var,"',..groupings[",var,"],'",method,"')])"
          )))
          
          for (row in nrow(names):1) {
            eval(parse(text=paste0(
              "output",names[row,1],"$name[1]<-unlist(names[",row,",2])"
            )))
          }
         
          if (var==length(groupings)){  
              for (row in nrow(names):1) {
                  eval(parse(text=paste0(
                    "output",names[row,1],"$value[1]<-unlist(names[",row,",3])"
                  )))
              }
            }
        }
        
        output <- list.clean(output, fun = is.null, recursive=T)
        return(r2d3(data=output, script = "hbar.js"))
}


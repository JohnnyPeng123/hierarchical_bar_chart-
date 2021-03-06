hbar <- function(data,groupings,method,left_margin = 200,font_size = 15, ticks_width = 100, num_variable=NULL,na.rm=T){
  
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
    
    eval(parse(text=paste0(
      "names$syntax_order", " <- as.numeric(gsub('[^0-9.-]','',names$syntax",var,"))"
    )))
    
    names <- names[order(syntax_order)]
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
  return(suppressWarnings(r2d3(data=output, script =gsub("10px", paste0(as.character(font_size),"px"),
                                                    gsub("/ 80", paste0("/ ",as.character(ticks_width)),
                                                    gsub(", 20", paste0(", ",as.character(font_size)),
                                                    gsub("left: 100", paste0("left: ",as.character(left_margin)),
                                                          readLines("https://raw.githubusercontent.com/JohnnyPeng123/hierarchical_bar_chart-/master/hbar.js")
                                                    ))))
                               )))
}

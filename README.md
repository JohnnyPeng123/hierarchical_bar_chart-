# Hierarchical Bar Chart (hbar chart) in R

Original visualization by @mbostockBy Mike Bostock from:

https://observablehq.com/@d3/hierarchical-bar-chart

![Alt Text](https://github.com/JohnnyPeng123/hierarchical_bar_chart-/blob/master/demo.gif)

I was amazed by this visualization, and I would like to create the same vis in R. (R is the primary language that I use for work)

so I have created this "hbar" function to replicate this visualization in R environment.

# How to Use the "hbar" function

A quick demo on how to use this "hbar" function to generate hierarchical bar chart in R:

https://github.com/JohnnyPeng123/hierarchical_bar_chart-/blob/master/demo.r

"hbar" function has 3 required arguments:

1. data - A data.table object in the R environment that contains the data that will be used to generate hbar chart.

2. groupings - A vector of strings that contains the names of the categorical variables that will form a hierarchical relationship, from left to right, representing the highest to the lowest level in this hierarchical relationship.

3. method - method will be used to perform aggregation, you can either use "count" or "sum", although "mean" is also available, but the output will not make sense at this stage, I am planning to show the average/median value as a dot/line on top of the bars in the future.

And 5 optional arguments with default value:

1. left_margin (default = 200) - the amount of white space on the left reservered for displaying the texts

2. font_size (default = 15) - size of the fonts for all the texts displayed in the graph

3. ticks_width (default = 100) - width between the ticks on the x-axis

4. num_variable (default = NULL) - if method does not equal to "count", you can use this to specify a numeric variable that should be used for aggregation.

5. na.rm (default = T) - whether or not to remove observations with missing values during aggregation.

# Files in this Repo

0. README.md documentation 

1. aug_train.csv - A sample data file that I used to develop this function. 
   It was downloaded from "https://www.kaggle.com/arashnic/hr-analytics-job-change-of-data-scientists"

2. hbar.js - JavaScript that used to generate the hbar, slightly modified from the original ones by Mike Bostock

3. hbar.r - R function named "hbar" that produce hbar chart in R environment leveraging "r2d3" package and the original D3.js by Mike Bostock

4. demo.r - a simple use case to demonstration how to use the hbar.r function to generate hbar chart.

# Hierarchical Bar Chart in R

Original visualization by @mbostockBy Mike Bostock from:

https://observablehq.com/@d3/hierarchical-bar-chart

The things that I did was:

1. Modified the original D3.js script so it can be read by "r2d3" package (which reads in D3.js and run it in R enviroment)
2. Added the data maniplation steps to convert scturctured R data.table formart into JSON format, so it can used by the D3.js script via read by "r2d3".
3. Wrapped all the data manipulation into a funciton

# Files in this Repo

1.aug_train.csv - was downloaded from:

https://www.kaggle.com/arashnic/hr-analytics-job-change-of-data-scientists

It's just a sample files that I used to develop this function.

# Function Arguments

There are 3 main arguments that is required to run this function:

1. data - A data.table object in the R environment 
2. js.path - Path to the original D3.js for 
======================================================
Getting and Cleaning Data Project 
=====================================================
This project is done to create tidy data set from the data set collected from expriment with wearable devices used by the Samsung Galaxy S smartphone.

The files included in this project are:

README.md
Codebook.md : Project and data set description
run_analysis.R: R script to clean and tidy up source data
tidy_data.txt: Tidy data created from this project

### Prerequisites:
  You need to install the following packages to run this program successfully:

  plyr, dplyr, stringr, tidyr

### Steps to create tidy data set:

1. Download all the source data from the link below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the files in a directory.
3. Download run_analysis.R and place in "UCI HAR Dataset" directory, which you got after unzipping the file in step 2.
4. Run run_analysis.R in RStudio or R. At the command prompt type:

> source("run_analysis.R")

  You should see the final dataset, y_tidy, in the console output.
  You will also see the messages on console, showing the progress of the execution. 

  At the end, this script cleans up all the variables, except y_tidy.
  



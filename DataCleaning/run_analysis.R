##************************************************************
##Script to create tidy data set from "Human Activity Recognition Using Smartphones" ##Project. 
## Two sets of data are read and merged to create tidy data set. Below prefixes are used
## to distiniguish between these two data sets, before they are merged.
##_tr == training
##_tt == test
##*******************************************

## set working directory to the directory, where the project files are downloaded.
## Run this file from working directory, e.g.
##setwd("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

##****************************************
##Let's first process the test data set
##****************************************

print("cleanup all the variables before starting creating tidy data set")
rm(list = ls())
print("Let's first process the test data set")

## Read test set, which is a vector of features, obtained by calculating variables 
##  from the time and frequency domain for each window, for a subject and activity

x_tt <- read.table("test/X_test.txt", header = FALSE)

## Read activity labels for each record in test set
y_tt <- read.table("test/y_test.txt", header = FALSE)

## Read subject labels, for each record in test set
sub_tt <- read.table("test/subject_test.txt", header = FALSE)

##  Read the each activity label and its name 
ac_label <- read.table("activity_labels.txt", header = FALSE)


library(plyr)
library(dplyr)

## Assign column names in ac_label data frame
colnames(ac_label) <- c("activity_num", "label")


## Create function to replace activity label with activity name 
## in activity label data frame, ytt

## Create empty vector
y_tt_rep <- c()


rep_ac <- function(dat = ac_label){
  ## read each row of activity lable table  
  for (i in 1:nrow(y_tt)) {

    # replace the activity label with activity name 
    x <- ac_label[which(ac_label$activity_num == y_tt[i, 1]), 2]
     
    # Put the activity name for each activity label
    y_tt_rep <- rbind(y_tt_rep, as.character(x))
  }

  y_tt_rep
 
}


##source("rep_ac.R")

## Get activity names for each activity label
y_tt_rep <- rep_ac(ac_label)

## Bind the activity names with the test data set, columnwise
y_tt1 <- cbind(y_tt_rep, x_tt)


## Bind the subject ids with the test data set, columnwise
ytt1 <- cbind( sub_tt, y_tt1)
dim(ytt1)

##Assign Column names for subject and activity in test data set
colnames(ytt1)[c(1,2)] <- c("subject", "activity")
colnames(ytt1)[c(1,2)] 

## Read all variable names, which will be assigned to test data set
features <- read.table("features.txt")

## Assign column names to all the variables in test data set
colnames(ytt1)[c(3:563)] <- as.character(features[,2])

## select column names having "mean" and "std" from test data set

library(stringr)
ytt <- cbind(ytt1[, 1:2], ytt1[, str_detect(colnames(ytt1), "-mean") ==TRUE], ytt1[, str_detect(colnames(ytt1), "-std") == TRUE])

## verify test data set
dim(ytt)

##Cleanup variables, which are not needed anymore
rm("sub_tt", "x_tt", "y_tt", "y_tt_rep", "y_tt1", "ytt1")

print("You completed processing test data set")

##****************************************
##Now process the training data set
##****************************************

print("Now process the training data set")

## Read training set, which is a vector of features, obtained by calculating variables 
##  from the time and frequency domain for each window, for a subject and activity
x_tr <- read.table("train/X_train.txt", header = FALSE)

## Read activity labels for each record in training set
y_tr <- read.table("train/y_train.txt", header = FALSE)

## Read subject labels, for each record in training set
sub_tr <- read.table("train/subject_train.txt", header = FALSE)

##  Read the each activity label and its name
ac_label <- read.table("activity_labels.txt", header = FALSE)


library(plyr)
library(dplyr)

## Assign column names in ac_label data frame
colnames(ac_label) <- c("activity_num", "label")

## Create function to replace activity label with activity name 
## in activity label data frame, ytt

## Create empty vector
y_tr_rep <- c()

rep_ac_train <- function(dat = ac_label){
 
  # read each row of activity lable table
  for (i in 1:nrow(y_tr)) {
    
    # replace the activity label with activity name 
    x <- ac_label[which(ac_label$activity_num == y_tr[i, 1]), 2]
   
    # Put the activity name for each activity label
    y_tr_rep <- rbind(y_tr_rep, as.character(x))
  }
  y_tr_rep
  
}



##source("rep_ac_train.R")

## Get activity names for each activity label
y_tr_rep <- rep_ac_train(ac_label)

## Bind the activity names with the training data set, columnwise
y_tr1 <- cbind(y_tr_rep, x_tr)

##  Bind the subject ids with the test data set, columnwise
ytr1 <- cbind( sub_tr, y_tr1)
dim(ytr1)

###Assign Column names for subject and activity in training data set
colnames(ytr1)[c(1,2)] <- c("subject", "activity")
colnames(ytr1)[c(1,2)] 

## Read all variable names, which will be assigned to training data set
features <- read.table("features.txt")


## Assign column names to all the variables in training data set
colnames(ytr1)[c(3:563)] <- as.character(features[,2])

## select column names having "mean" and "std" from training data set

library(stringr)
ytr <- cbind(ytr1[, 1:2], ytr1[, str_detect(colnames(ytr1), "-mean") ==TRUE], ytr1[, str_detect(colnames(ytr1), "-std") ==TRUE])

## verify training data set
dim(ytr)


##Cleanup variables, which are not needed anymore
rm("sub_tr", "x_tr", "y_tr", "y_tr_rep", "y_tr1", "ytr1")

print("You completed processing training data set")

##*************************************************
##Final data set
## ************************************************

## Merge test and training data set
print("Merge test and training data set")
 yfinal <- rbind(ytt, ytr)
 dim(yfinal)

##create tidy data set by gathering all the variables and values 
##under columns "variable" and "value"
library(tidyr)
y_gather <- gather(yfinal, variable, value, 3:81 )

## calulate mean for each variable
print("calulate mean for each variable")
y_tidy <- ddply(y_gather, .(subject, activity, variable), summarize, avg_value = mean(value))

## Verify means for each variable
View(y_tidy)



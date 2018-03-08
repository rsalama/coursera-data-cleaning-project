library(dplyr)

## readData function
## inputs:
##        dir: directory which contains the data (test or train)
##   features: column names we care about (std and mean)
##     actvts: lookup table with activity label and numeric equivalent
## output:
##   dataframe consisting of the std and mean columns, subject number, and activity labels as text
readData <- function(d, features, actvts) {
  ## process data in given directory (dir)
  ## read subject (f == "dir/subject_dir.txt" -- ie "train/subject_train.txt")
  f <- sprintf("%s/subject_%s.txt", d, d)
  subj <- read.table(f, col.names = c("subject"))
  
  ## read y_test and substitute label number for label name
  ## (f == dir/y_dir.txt" -- ie "train/y_train.txt")
  f <- sprintf("%s/y_%s.txt", d, d)
  y <- read.table(f, col.names = c("label")) %>%
    merge(actvts,by.x = "label", by.y = "i")
  
  ## read X_test and keep only the columns we care about (features[,1])
  f <- sprintf("%s/X_%s.txt", d, d)
  X <- read.table(f)[,features[,c("i")]]
  ## rename columns using features[,2]
  colnames(X) <- features[,c("n")]
  ## add subject and label columns, could also use cbind
  X <- mutate(X, subject = subj[,1]) %>% mutate(activity = y[,2])
  return(X)
}

## Download data 
setwd("/tmp")
if(!dir.exists("./data")) dir.create("./data")
setwd("./data")

## Download data 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "UCI HAR Dataset.zip"
download.file(url, f, method = "curl")
if (file.exists(f)) unzip(f)
setwd("./UCI HAR Dataset")

## Read features file 
## filter only the ones we need (mean and std) clean up names by removing ()'s and duplicate text
## features will contains column index (i) and name (n)
##   i               n
## 1 1 tBodyAcc-mean-X
## 2 2 tBodyAcc-mean-Y
## 3 3 tBodyAcc-mean-Z
## 4 4  tBodyAcc-std-X
## 5 5  tBodyAcc-std-Y
## 6 6  tBodyAcc-std-Z
## ...
features <- read.table("features.txt", sep = " ", col.names = c("i", "n")) %>% 
  filter(grepl("mean\\(\\)|std\\(\\)",n)) %>%
  mutate(n = gsub("BodyBody","Body", n)) %>%
  mutate(n = gsub("\\(\\)", "", n))

## load activity labels and rename columns
## i           activity
## 1 1            WALKING
## 2 2   WALKING_UPSTAIRS
## 3 3 WALKING_DOWNSTAIRS
## 4 4            SITTING
## 5 5           STANDING
## 6 6             LAYING
actvts <- read.table("activity_labels.txt", sep = " ", col.names = c("i", "activity"))

dftest <- readData("test", features = features, actvts = actvts)
dftrain <- readData("train", features = features, actvts = actvts)

## combine test and train data frames
dfall <- rbind(dftest,dftrain)
dfall <- mutate(dfall, subject = as.factor(dfall$subject))

smry <- dfall %>% 
  group_by(activity, subject) %>% ## Group by activity then subject
  summarise_all(funs(mean))       ## summarize, compute means for each column

write.table(smry, "AvgByActivityAndSubject.txt", row.names = FALSE)

## Notes: I realize this solution is a bit different than what the assignment asked for:
## first merge the train data and the test data then apply all the transformations.
## To do that, would need to:
## 1. read X_test and X_train, and rbind them 
## 2. use features to pick out the columns we nead and to rename them
## 3. read y_test and y_train and rbind them
## 4. cbind the df's resulting from 2 & 3
## 5. merge the actvts with df from 4 to get text labels for the activities
## I found that writing a function that did this per data set and then merged resulted in cleaner
## code.
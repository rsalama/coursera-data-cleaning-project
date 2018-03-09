# Running the script
## `script`: run_analysis.R
## `assumptions`: 
* Runs under Linux 
* Expects directory `/tmp` to exist and be writable
* Can load the dplyr library `library(dplyr)`

## Script contents:
* Defines a function, `readData <- function(d, features, actvts)` which takes the following inputs:
.* dir: directory which contains the data (test or train)
* features: column names we care about (std and mean)
* actvts: lookup table with activity label and numeric equivalent
* Outputs: dataframe consisting of the std and mean columns, subject number, and activity labels as text 
* Script downloads the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzips the file and sets the working directory to UCI HAR Dataset
* creates an activities data frame by reading activity_labels.txt
* creates a features data frame by reading features.txt, uses filter, grepl and gsub to clean up names, removes ()'s
* calls readData for both `test` and `train` datasets with activities and features as arguements
* combines test and train dataframe into an `dfall` data frame
* Creates a second tidy data set, which groups dfall by activity and subject 
* Uses summarise_all to provide the means of each column (see Code Book below).

# Code Book
## ID Fields
|name|levels|description|
|---|---|---|
|subject|1 - 30|number corresponding to subject in the test|
|activity|LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS|activity when measurement was taken|

## Feature fields extracted from data
## index corresponds to the position of column in the original data
|index|original col name|new col name|range\
|---:|:---:|:---|
|1|tBodyAcc-mean()-X|tBodyAcc-mean-X|-1.0 - 1.0|
|2|tBodyAcc-mean()-Y|tBodyAcc-mean-Y|-1.0 - 1.0|
|3|tBodyAcc-mean()-Z|tBodyAcc-mean-Z|-1.0 - 1.0|
|4|tBodyAcc-std()-X|tBodyAcc-std-X|-1.0 - 1.0|
|5|tBodyAcc-std()-Y|tBodyAcc-std-Y|-1.0 - 1.0|
|6|tBodyAcc-std()-Z|tBodyAcc-std-Z|-1.0 - 1.0|
|41|tGravityAcc-mean()-X|tGravityAcc-mean-X|-1.0 - 1.0|
|42|tGravityAcc-mean()-Y|tGravityAcc-mean-Y|-1.0 - 1.0|
|43|tGravityAcc-mean()-Z|tGravityAcc-mean-Z|-1.0 - 1.0|
|44|tGravityAcc-std()-X|tGravityAcc-std-X|-1.0 - 1.0|
|45|tGravityAcc-std()-Y|tGravityAcc-std-Y|-1.0 - 1.0|
|46|tGravityAcc-std()-Z|tGravityAcc-std-Z|-1.0 - 1.0|
|81|tBodyAccJerk-mean()-X|tBodyAccJerk-mean-X|-1.0 - 1.0|
|82|tBodyAccJerk-mean()-Y|tBodyAccJerk-mean-Y|-1.0 - 1.0|
|83|tBodyAccJerk-mean()-Z|tBodyAccJerk-mean-Z|-1.0 - 1.0|
|84|tBodyAccJerk-std()-X|tBodyAccJerk-std-X|-1.0 - 1.0|
|85|tBodyAccJerk-std()-Y|tBodyAccJerk-std-Y|-1.0 - 1.0|
|86|tBodyAccJerk-std()-Z|tBodyAccJerk-std-Z|-1.0 - 1.0|
|121|tBodyGyro-mean()-X|tBodyGyro-mean-X|-1.0 - 1.0|
|122|tBodyGyro-mean()-Y|tBodyGyro-mean-Y|-1.0 - 1.0|
|123|tBodyGyro-mean()-Z|tBodyGyro-mean-Z|-1.0 - 1.0|
|124|tBodyGyro-std()-X|tBodyGyro-std-X|-1.0 - 1.0|
|125|tBodyGyro-std()-Y|tBodyGyro-std-Y|-1.0 - 1.0|
|126|tBodyGyro-std()-Z|tBodyGyro-std-Z|-1.0 - 1.0|
|161|tBodyGyroJerk-mean()-X|tBodyGyroJerk-mean-X|-1.0 - 1.0|
|162|tBodyGyroJerk-mean()-Y|tBodyGyroJerk-mean-Y|-1.0 - 1.0|
|163|tBodyGyroJerk-mean()-Z|tBodyGyroJerk-mean-Z|-1.0 - 1.0|
|164|tBodyGyroJerk-std()-X|tBodyGyroJerk-std-X|-1.0 - 1.0|
|165|tBodyGyroJerk-std()-Y|tBodyGyroJerk-std-Y|-1.0 - 1.0|
|166|tBodyGyroJerk-std()-Z|tBodyGyroJerk-std-Z|-1.0 - 1.0|
|201|tBodyAccMag-mean()|tBodyAccMag-mean|-1.0 - 1.0|
|202|tBodyAccMag-std()|tBodyAccMag-std|-1.0 - 1.0|
|214|tGravityAccMag-mean()|tGravityAccMag-mean|-1.0 - 1.0|
|215|tGravityAccMag-std()|tGravityAccMag-std|-1.0 - 1.0|
|227|tBodyAccJerkMag-mean()|tBodyAccJerkMag-mean|-1.0 - 1.0|
|228|tBodyAccJerkMag-std()|tBodyAccJerkMag-std|-1.0 - 1.0|
|240|tBodyGyroMag-mean()|tBodyGyroMag-mean|-1.0 - 1.0|
|241|tBodyGyroMag-std()|tBodyGyroMag-std|-1.0 - 1.0|
|253|tBodyGyroJerkMag-mean()|tBodyGyroJerkMag-mean|-1.0 - 1.0|
|254|tBodyGyroJerkMag-std()|tBodyGyroJerkMag-std|-1.0 - 1.0|
|266|fBodyAcc-mean()-X|fBodyAcc-mean-X|-1.0 - 1.0|
|267|fBodyAcc-mean()-Y|fBodyAcc-mean-Y|-1.0 - 1.0|
|268|fBodyAcc-mean()-Z|fBodyAcc-mean-Z|-1.0 - 1.0|
|269|fBodyAcc-std()-X|fBodyAcc-std-X|-1.0 - 1.0|
|270|fBodyAcc-std()-Y|fBodyAcc-std-Y|-1.0 - 1.0|
|271|fBodyAcc-std()-Z|fBodyAcc-std-Z|-1.0 - 1.0|
|345|fBodyAccJerk-mean()-X|fBodyAccJerk-mean-X|-1.0 - 1.0|
|346|fBodyAccJerk-mean()-Y|fBodyAccJerk-mean-Y|-1.0 - 1.0|
|347|fBodyAccJerk-mean()-Z|fBodyAccJerk-mean-Z|-1.0 - 1.0|
|348|fBodyAccJerk-std()-X|fBodyAccJerk-std-X|-1.0 - 1.0|
|349|fBodyAccJerk-std()-Y|fBodyAccJerk-std-Y|-1.0 - 1.0|
|350|fBodyAccJerk-std()-Z|fBodyAccJerk-std-Z|-1.0 - 1.0|
|424|fBodyGyro-mean()-X|fBodyGyro-mean-X|-1.0 - 1.0|
|425|fBodyGyro-mean()-Y|fBodyGyro-mean-Y|-1.0 - 1.0|
|426|fBodyGyro-mean()-Z|fBodyGyro-mean-Z|-1.0 - 1.0|
|427|fBodyGyro-std()-X|fBodyGyro-std-X|-1.0 - 1.0|
|428|fBodyGyro-std()-Y|fBodyGyro-std-Y|-1.0 - 1.0|
|429|fBodyGyro-std()-Z|fBodyGyro-std-Z|-1.0 - 1.0|
|503|fBodyAccMag-mean()|fBodyAccMag-mean|-1.0 - 1.0|
|504|fBodyAccMag-std()|fBodyAccMag-std|-1.0 - 1.0|
|516|fBodyBodyAccJerkMag-mean()|fBodyBodyAccJerkMag-mean|-1.0 - 1.0|
|517|fBodyBodyAccJerkMag-std()|fBodyBodyAccJerkMag-std|-1.0 - 1.0|
|529|fBodyBodyGyroMag-mean()|fBodyBodyGyroMag-mean|-1.0 - 1.0|
|530|fBodyBodyGyroMag-std()|fBodyBodyGyroMag-std|-1.0 - 1.0|
|542|fBodyBodyGyroJerkMag-mean()|fBodyBodyGyroJerkMag-mean|-1.0 - 1.0|
|543|fBodyBodyGyroJerkMag-std()|fBodyBodyGyroJerkMag-std|-1.0 - 1.0|

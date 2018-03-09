# Running the script
## `script`: run_analysis.R
## `assumptions`: 
* Runs under Linux 
* Expects directory `/tmp` to exist and be writable
* Can load the dplyr library `library(dplyr)`

## Script contents:
* Defines a function, `readData <- function(d, features, actvts)` which takes the following inputs:
** dir: directory which contains the data (test or train)
** features: column names we care about (std and mean)
** actvts: lookup table with activity label and numeric equivalent
** Outputs: dataframe consisting of the std and mean columns, subject number, and activity labels as text 
* Script downloads the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzips the file and sets the working directory to UCI HAR Dataset
* creates an activities data frame by reading activity_labels.txt
* creates a features data frame by reading features.txt
* calls readData for both `test` and `train` datasets with activities and features as arguements
* combines test and train dataframe into an `dfall` data frame
* For the second tidy data set, groups dfall by activity and subject 
* uses summarise_all to provide the means of each column.

# Code Book
## ID Fields
|name|levels|description|
|---|---|---|
|subject|1 - 30|number corresponding to subject in the test|
|activity|LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS|activity when measurement was taken|

## Feature fields extracted from data
## index corresponds to the position of column in the original data
|index|original col name|new col name|
|---:|:---:|:---|
|1|tBodyAcc-mean()-X|tBodyAcc-mean-X|
|2|tBodyAcc-mean()-Y|tBodyAcc-mean-Y|
|3|tBodyAcc-mean()-Z|tBodyAcc-mean-Z|
|4|tBodyAcc-std()-X|tBodyAcc-std-X|
|5|tBodyAcc-std()-Y|tBodyAcc-std-Y|
|6|tBodyAcc-std()-Z|tBodyAcc-std-Z|
|41|tGravityAcc-mean()-X|tGravityAcc-mean-X|
|42|tGravityAcc-mean()-Y|tGravityAcc-mean-Y|
|43|tGravityAcc-mean()-Z|tGravityAcc-mean-Z|
|44|tGravityAcc-std()-X|tGravityAcc-std-X|
|45|tGravityAcc-std()-Y|tGravityAcc-std-Y|
|46|tGravityAcc-std()-Z|tGravityAcc-std-Z|
|81|tBodyAccJerk-mean()-X|tBodyAccJerk-mean-X|
|82|tBodyAccJerk-mean()-Y|tBodyAccJerk-mean-Y|
|83|tBodyAccJerk-mean()-Z|tBodyAccJerk-mean-Z|
|84|tBodyAccJerk-std()-X|tBodyAccJerk-std-X|
|85|tBodyAccJerk-std()-Y|tBodyAccJerk-std-Y|
|86|tBodyAccJerk-std()-Z|tBodyAccJerk-std-Z|
|121|tBodyGyro-mean()-X|tBodyGyro-mean-X|
|122|tBodyGyro-mean()-Y|tBodyGyro-mean-Y|
|123|tBodyGyro-mean()-Z|tBodyGyro-mean-Z|
|124|tBodyGyro-std()-X|tBodyGyro-std-X|
|125|tBodyGyro-std()-Y|tBodyGyro-std-Y|
|126|tBodyGyro-std()-Z|tBodyGyro-std-Z|
|161|tBodyGyroJerk-mean()-X|tBodyGyroJerk-mean-X|
|162|tBodyGyroJerk-mean()-Y|tBodyGyroJerk-mean-Y|
|163|tBodyGyroJerk-mean()-Z|tBodyGyroJerk-mean-Z|
|164|tBodyGyroJerk-std()-X|tBodyGyroJerk-std-X|
|165|tBodyGyroJerk-std()-Y|tBodyGyroJerk-std-Y|
|166|tBodyGyroJerk-std()-Z|tBodyGyroJerk-std-Z|
|201|tBodyAccMag-mean()|tBodyAccMag-mean|
|202|tBodyAccMag-std()|tBodyAccMag-std|
|214|tGravityAccMag-mean()|tGravityAccMag-mean|
|215|tGravityAccMag-std()|tGravityAccMag-std|
|227|tBodyAccJerkMag-mean()|tBodyAccJerkMag-mean|
|228|tBodyAccJerkMag-std()|tBodyAccJerkMag-std|
|240|tBodyGyroMag-mean()|tBodyGyroMag-mean|
|241|tBodyGyroMag-std()|tBodyGyroMag-std|
|253|tBodyGyroJerkMag-mean()|tBodyGyroJerkMag-mean|
|254|tBodyGyroJerkMag-std()|tBodyGyroJerkMag-std|
|266|fBodyAcc-mean()-X|fBodyAcc-mean-X|
|267|fBodyAcc-mean()-Y|fBodyAcc-mean-Y|
|268|fBodyAcc-mean()-Z|fBodyAcc-mean-Z|
|269|fBodyAcc-std()-X|fBodyAcc-std-X|
|270|fBodyAcc-std()-Y|fBodyAcc-std-Y|
|271|fBodyAcc-std()-Z|fBodyAcc-std-Z|
|345|fBodyAccJerk-mean()-X|fBodyAccJerk-mean-X|
|346|fBodyAccJerk-mean()-Y|fBodyAccJerk-mean-Y|
|347|fBodyAccJerk-mean()-Z|fBodyAccJerk-mean-Z|
|348|fBodyAccJerk-std()-X|fBodyAccJerk-std-X|
|349|fBodyAccJerk-std()-Y|fBodyAccJerk-std-Y|
|350|fBodyAccJerk-std()-Z|fBodyAccJerk-std-Z|
|424|fBodyGyro-mean()-X|fBodyGyro-mean-X|
|425|fBodyGyro-mean()-Y|fBodyGyro-mean-Y|
|426|fBodyGyro-mean()-Z|fBodyGyro-mean-Z|
|427|fBodyGyro-std()-X|fBodyGyro-std-X|
|428|fBodyGyro-std()-Y|fBodyGyro-std-Y|
|429|fBodyGyro-std()-Z|fBodyGyro-std-Z|
|503|fBodyAccMag-mean()|fBodyAccMag-mean|
|504|fBodyAccMag-std()|fBodyAccMag-std|
|516|fBodyBodyAccJerkMag-mean()|fBodyBodyAccJerkMag-mean|
|517|fBodyBodyAccJerkMag-std()|fBodyBodyAccJerkMag-std|
|529|fBodyBodyGyroMag-mean()|fBodyBodyGyroMag-mean|
|530|fBodyBodyGyroMag-std()|fBodyBodyGyroMag-std|
|542|fBodyBodyGyroJerkMag-mean()|fBodyBodyGyroJerkMag-mean|
|543|fBodyBodyGyroJerkMag-std()|fBodyBodyGyroJerkMag-std|

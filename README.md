# Running the script
## `script`: run_analysis.R
## `assumptions`: 
* Runs under Linux 
* Expects directory `/tmp` to exist and be writable
* Can load the dplyr library `library(dplyr)`

## Script contents:
* Defines a function, `readData <- function(d, features, actvts)` which takes the following inputs:
  * dir: directory which contains the data (test or train)
  * features: column names we care about (std and mean)
  * actvts: lookup table with activity label and numeric equivalent
* Outputs: dataframe consisting of the std and mean columns, subject number, and activity labels as text 
* The function does the following:
  * Reads the subject_DIR.txt Where DIR is either test or train
  * reads the y_DIR.txt and merges with activities to change numeric activity to text label
  * reads the X_DIR.txt file and renames the columns according the features
  * adds subject and activity columns
  * Returns the dataframe
* Script downloads the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzips the file and sets the working directory to UCI HAR Dataset
* creates an activities data frame by reading activity_labels.txt
* creates a features data frame by reading features.txt, uses filter, grepl and gsub to clean up names, removes ()'s
* calls readData for both `test` and `train` datasets with activities and features as arguements
* combines test and train dataframe into an `dfall` data frame
* Creates a second tidy data set, which groups dfall by activity and subject 
* Uses summarise_all to provide the means of each column (see Code Book below).

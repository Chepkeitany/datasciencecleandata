
# This file provides a brief description of the files and directories in this repo.
The tidy data in [tidy_dataset.txt](./tidy_dataset.txt) can be read into R with the following code:
read.table("tidy_dataset.txt")

## Overview

[Codebook.md](./Codebook.md) describes the specific details of variables, values, and units in the tidy data set.

The [tidy_dataset.txt](./tidy_data_set.txt) file in this directory is a tidy subset of the data provided in the Human Activity Recognition Using Smartphones Data Set. The source data is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# and can be downloaded from here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

tidy_dataset.txt includes the combined test and training data sets from the following files:

- [UCI HAR Dataset/test/subject_test.txt](./UCI HAR Dataset/test/subject_test.txt)
- [UCI HAR Dataset/test/X_test.txt](./UCI HAR Dataset/test/X_test.txt)
- [UCI HAR Dataset/test/y_test.txt](./UCI HAR Dataset/test/y_test.txt)
- [UCI HAR Dataset/train/subject_train.txt](./UCI HAR Dataset/train/subject_train.txt)
- [UCI HAR Dataset/train/X_train.txt](./UCI HAR Dataset/train/X_train.txt)
- [UCI HAR Dataset/train/y_train.txt](./UCI HAR Dataset/train/y_train.txt)

The main principles of tidy data that I employed were:

1. Each column represents a variable or measure or characteristic.
2. Each variable is in one column.
3. Each observation of the variable is in a different row.

[Codebook.md](./codebook.md) describes the tidy data set.


## Description of run_analysis.R

[run_analysis.R](./run_analysis.R) takes source data from the **UCI Har Dataset** directory, imports it into R, and transforms it into a tidy data subset.

The script performs the following operations to import, clean, and transform the data set. These steps are also indicated in comments throughout the .R file.


## Special instructions for running run_analysis.R

- The script assumes that the data source files are in the same directory as the script. It assumes that the directory structure and file names and locations with UCI Har Dataset have not been changed since they were extracted from the source .zip file.
- The references to file locations in [run_analysis.R](./run_analysis.R) are written to work with the Mac file system.

# Many Thanks
This project borrows concepts detailed in https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ and implementations by students in the course over the past year.

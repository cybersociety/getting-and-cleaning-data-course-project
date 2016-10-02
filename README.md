### Overview

The purpose of this project is to demonstrate how to collect, work with, and clean a data set.

## Steps to Modify This Script

Clone or Download the project and unzipped the source files, you will need to make one modification to the R file before you can process the data.

setwd('/Users/cybersociety/coursera/datascience/UCI HAR Dataset/');


## Code Book
GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.


## Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It has a script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

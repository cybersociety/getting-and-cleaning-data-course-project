Coursera oursera Getting and Cleaning Data Course Project

# run_Analysis.R File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################
filename <- "getdata_dataset.zip"

## Download and unzip the dataset:

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL, filename, method="curl")
 
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
setwd('/Users/cybersociety/coursera/datascience/UCI HAR Dataset/');

# Read and Load activity labels + features
activityLabels <- read.table("./activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)


# Load the datasets
train <- read.table("./train/X_train.txt")[featuresWanted]
trainActivities <- read.table("./train/Y_train.txt")
trainSubjects <- read.table("./train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./test/X_test.txt")[featuresWanted]
testActivities <- read.table("./test/Y_test.txt")
testSubjects <- read.table("./test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge training and test data to create a final data set
totalData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

# turn activities & subjects into factors
totalData$activity <- factor(totalData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
totalData$subject <- as.factor(totalData$subject)

totalData.melted <- melt(totalData, id = c("subject", "activity"))
totalData.mean <- dcast(totalData.melted, subject + activity ~ variable, mean)
  
# Export the tidyData set 
write.table(totalData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

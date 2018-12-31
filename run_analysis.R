###################################################################################################
# Filename: run_analysis.R
#
# Objective: Create a tidy data set from data collected using smartphone motion sensors.
#            
# Output: Text file with tidy data named "tidy_data.txt".
###################################################################################################

## install and load useful packages (dplyr and stringr mandotory for the current script version)
rm(list=ls())

if (require("data.table") == FALSE) {
        install.packages("data.table")
}
if (require("dplyr") == FALSE) {
        install.packages("data.table")
}
if (require("tidyr") == FALSE) {
        install.packages("data.table")
}
if (require("stringr") == FALSE) {
        install.packages("data.table")
}

library(data.table)
library(dplyr)
library(tidyr)
library(stringr)

###################################################################################################

## download and unzip files (if this hasn't done before)
file_destination <- "Smartphone_Motion_Data.zip"

if (!file.exists(file_destination)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, file_destination, method="curl")
        DateDownloaded <- date()
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(file_destination) 
}

###################################################################################################

## read data into R
directory <- "./UCI HAR Dataset/"
train_directory <- "./UCI HAR Dataset/train/"
test_directory <- "./UCI HAR Dataset/test/"

features <- read.table(paste0(directory, "features.txt"), col.names = c("feature_ID","features"))
activity_labels <- read.table(paste0(directory, "activity_labels.txt"), col.names = c("Activity_ID", "Activity"))

x_train <- read.table(paste0(train_directory,"X_train.txt"), col.names = features$features)
y_train <- read.table(paste0(train_directory, "y_train.txt"), col.names = "Activity")
subject_train <- read.table(paste0(train_directory, "subject_train.txt"), col.names = "Subject_ID")

x_test <- read.table(paste0(test_directory, "X_test.txt"), col.names = features$features)
y_test <- read.table(paste0(test_directory, "y_test.txt"), col.names = "Activity")
subject_test <- read.table(paste0(test_directory, "subject_test.txt"), col.names = "Subject_ID")

###################################################################################################

## merge training and test data sets and select only std and mean data
all_data <- rbind(cbind(subject_train, y_train, x_train), cbind(subject_test, y_test, x_test))

std_mean_columns <- grepl("Subject_ID|Activity|.*mean.*|.*std.*", colnames(all_data))

std_mean_data <- all_data[, std_mean_columns]

###################################################################################################

## label activities in the data set using descriptive names
std_mean_data$Activity <- factor(std_mean_data$Activity, levels = activity_labels[, 1], labels = activity_labels[, 2])

###################################################################################################

## label the data set columns using descriptive variable names
colnames(std_mean_data) <- gsub("\\.", "", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("mean", "Mean", colnames(std_mean_data), ignore.case = TRUE)
colnames(std_mean_data) <- gsub("std", "STD", colnames(std_mean_data), ignore.case = TRUE)
colnames(std_mean_data) <- gsub("freq", "Frequency", colnames(std_mean_data), ignore.case = TRUE)
colnames(std_mean_data) <- gsub("^t", "Time", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("^f", "Frequency", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("Acc", "Accelerometer", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("Gyro", "Gyroscope", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("BodyBody", "Body", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("Mag", "Magnitude", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("tBody", "TimeBody", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("angle", "Angle", colnames(std_mean_data))
colnames(std_mean_data) <- gsub("gravity", "Gravity", colnames(std_mean_data))

###################################################################################################

## create a tidy data set with the average of each variable for each activity and each subject
tidy_data <- std_mean_data %>% group_by(Subject_ID, Activity) %>% summarise_all(funs(mean))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE, quote = FALSE)

rm("activity_labels", "directory", "features", "file_destination", "std_mean_columns", "std_mean_data",
   "subject_test", "subject_train", "test_directory", "train_directory", "x_test", "x_train", "y_test", "y_train")

#Q1. & Q3.  Merges the training and the test sets to create one data set.
library(dplyr)
library(tidyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "UCI HAR Dataset.zip",mode = "wb")
unzip("UCI HAR Dataset.zip")
test_data = read.table("UCI HAR Dataset/test/X_test.txt")
test_label = read.table("UCI HAR Dataset/test/y_test.txt")
test_subject = read.table("UCI HAR Dataset/test/subject_test.txt")
train_data = read.table("UCI HAR Dataset/train/X_train.txt")
train_label = read.table("UCI HAR Dataset/train/y_train.txt")
train_subject = read.table("UCI HAR Dataset/train/subject_train.txt")
features <- readLines("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
data_set <- bind_rows(test_data, train_data)
label_set <- bind_rows(test_label, train_label)
subject_set <- bind_rows(test_subject, train_subject)
names(label_set) <- "activity"
names(subject_set) <- "subject"
names(data_set) <- features
descriptive.data <- bind_cols(data_set, label_set, subject_set)

#Q2. Extracts only the measurements on the mean and standard deviation
#    for each measurement. 
descriptive.data <- select(descriptive.data, subject
                           , activity, contains("mean"), contains("std"))

#Q3. Uses descriptive activity names to name the activities in the data set
descriptive.data$activity[descriptive.data$activity == 1] <- "Walking"
descriptive.data$activity[descriptive.data$activity == 2] <- "WALKING_UPSTAIRS"
descriptive.data$activity[descriptive.data$activity == 3] <- "WALKING_DOWNSTAIRS"
descriptive.data$activity[descriptive.data$activity == 4] <- "SITTING"
descriptive.data$activity[descriptive.data$activity == 5] <- "STANDING"
descriptive.data$activity[descriptive.data$activity == 6] <- "LAYING"

#Q5.  Creates a second, independent tidy data set with the average of each 
#     variable for each activity and each subject.

x<- aggregate(x = descriptive.data,
          by = list(descriptive.data$subject, descriptive.data$activity),
          FUN = mean)
clean <- select(x, -c(subject, activity))
clean <- arrange(clean, Group.1)
final <- gather(clean, measure, value, - c(Group.1, Group.2))
names(final) <- c("Subject", "Activity", "Measure", "Value")

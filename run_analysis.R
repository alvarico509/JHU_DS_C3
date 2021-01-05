#Getting and Cleaning Data Course Project - JHU - ALVARO LOZANO ALONSO

library(dplyr)
library(data.table)

setwd("~/Documents/Dokumente - MacBook Air/Data Science with R - Johns Hopkins University/C3")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
rm(X_test)
rm(y_test)
rm(X_train)
rm(y_train)
rm(subject_test)
rm(subject_train)
names(X) <- features$V2
rm(features)
y$V1 <- activity_labels[y$V1, "V2"]
rm(activity_labels)
dataset <- cbind(X, y)
rm(X)
rm(y)
setnames(dataset, "V1", "label")
dataset$subject <- subject
rm(subject)

subsetMeanSD <- dataset %>% select(label, subject, contains("mean"), contains("std"))

names(subsetMeanSD) <- gsub("Acc", "Accelerometer", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("Gyro", "Gyroscope", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("BodyBody", "Body", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("Mag", "Magnitude", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("^t", "Time", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("^f", "Frequency", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("tBody", "TimeBody", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("-mean()", "Mean", names(subsetMeanSD), ignore.case = TRUE)
names(subsetMeanSD) <- gsub("-std()", "STD", names(subsetMeanSD), ignore.case = TRUE)
names(subsetMeanSD) <- gsub("-freq()", "Frequency", names(subsetMeanSD), ignore.case = TRUE)
names(subsetMeanSD) <- gsub("angle", "Angle", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("gravity", "Gravity", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("Freq", "Frequency", names(subsetMeanSD))
names(subsetMeanSD) <- gsub("std", "StandardDeviation", names(subsetMeanSD))

Final_DataFrame <- subsetMeanSD %>%
  group_by(subject, label) %>%
  summarise_all(list(mean))

str(Final_DataFrame)

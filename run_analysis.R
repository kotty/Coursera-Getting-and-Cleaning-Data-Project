## Library required
library(reshape2)

## Make sure your working directory is pointing at the folder containing 'UCI HAR Dataset' folder
if (!file.exists("UCI HAR Dataset")) {
    stop("Please point our working directory to the folder containing 'UCI HAR Dataset' Folder ")
}

## Read feature and activity labels
features <- as.character(read.table("./UCI HAR Dataset/features.txt")[,2])
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Extracts only the measurements on the mean and standard deviation for each measurement
required_features <- grepl("mean|std", features)

## Load all the required datasets from file
dataTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")[required_features]
dataSubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dataActivitiesTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")

dataTest <- read.table("./UCI HAR Dataset/test/X_test.txt")[required_features]
dataSubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dataActivitiesTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")

## Merge training and test datasets
dataTrain <- cbind(dataSubjectTrain, dataActivitiesTrain, dataTrain)
dataTest <- cbind(dataSubjectTest, dataActivitiesTest, dataTest)

## Merges the training and the test sets to create one data set
combinedData <- rbind(dataTrain, dataTest)

## Appropriately labels the data set with descriptive variable names
colnames(combinedData) <- c("Subject", "Activity", features[required_features])

## Uses descriptive activity names to name the activities in the data set
combinedData$Activity <- factor(combinedData$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
combinedData$Subject <- as.factor(combinedData$Subject)

## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject

melted <- melt(combinedData, id = c("Subject", "Activity"))
combinedMean <- dcast(melted, Subject + Activity ~ variable, mean)
write.table(combinedMean, "tidy.txt", row.names = FALSE, quote = FALSE)


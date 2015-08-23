# Getting and Cleaning Data

## Course Project

### Project Intro

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project Task

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps for running this

1. Download the raw data and unzip it to a folder. This folder now should contains another folder called 'UCI HAR Dataset'.
2. Set this folder as the working directory, which is the parent directory of 'UCI HAR DAtaset' Folder.
3. Put run_analysis.R file in your working directory and run it
4. After it finish loading you should find a new file called "tidy.txt" in your working directory
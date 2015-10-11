## Program: run_Analysis.R
##
## Coursera getdata-032: Getting and Cleaning Data
## Author: Ryan Maley
##
## The program
## 1) Merges the training and the test sets to create one data set.
## 2)Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3)Uses descriptive activity names to name the activities in the data set
## 4)Appropriately labels the data set with descriptive variable names. 
## 5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
run_analysis <- function (){
        ##
        ## 1) Merges the training and the test sets to create one data set.
        ## 
        ZipArchive <- tempfile()
        ZipArchive <- "getdata_projectfiles_UCI HAR Dataset.zip"

        ## Download file from original location
        ## Next line coukd be commented out once downlaoded in fvarious operations
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",ZipArchive)
        
        ## Put the train subject, activity and data files together
        TrainData <- cbind(read.table(unz(ZipArchive,"UCI HAR Dataset/train/subject_train.txt")),
                         read.table(unz(ZipArchive,"UCI HAR Dataset/train/y_train.txt")),
                         read.table(unz(ZipArchive,"UCI HAR Dataset/train/X_train.txt")) )
        ## Put the train subject, activity and data files together
        TestData <- cbind(read.table(unz(ZipArchive,"UCI HAR Dataset/test/subject_test.txt")),
                          read.table(unz(ZipArchive,"UCI HAR Dataset/test/y_test.txt")),
                           read.table(unz(ZipArchive,"UCI HAR Dataset/test/X_test.txt")) )
   
        ## Combine the training and test data files into a single set
        AllData <- rbind(TrainData,TestData)
        
        ## Use some good column names from another file in the download
        x <- read.table(unz(ZipArchive,"UCI HAR Dataset/features.txt"),
                        stringsAsFactors=FALSE)
        NewNames <- c("Subject","Activity",x[,2])
        colnames(AllData) <- NewNames
        
        ## Read the activity labels from the download
        x <- read.table(unz(ZipArchive,"UCI HAR Dataset/activity_labels.txt"),
                        stringsAsFactors=FALSE)
        x <- x[,2]
        AllData$Activity <- x[AllData$Activity]
        
        
        ## 2)Extracts only the measurements on the mean and standard deviation for each measurement. 
        ##
        ExtractData <- AllData[,grep("Subject|Activity|mean|Mean|std",colnames(AllData))]
        ## Don't think Meanfreq should be included so remove
        ExtractData <- ExtractData[,-grep("meanFreq",colnames(ExtractData))]
        
        ## 3)Uses descriptive activity names to name the activities in the data set
        ## See above - applied activity labels previously
        
        ## 4)Appropriately labels the data set with descriptive variable names. 
        ## See above - applied good names previously
        
        ## 5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        ## write the tidy data file
        write.table(ExtractData,file="ExtractedData.txt",row.names =FALSE)
}
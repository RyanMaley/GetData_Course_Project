---
title: "CodeBook"
author: "Ryan Maley"
date: "October 11, 2015"
output: html_document
---

This document provides documentation for the Course Project for getedata-032 *Getting and Cleaning Data*


##The Data

The data set for the project was downloaded from the link provided in the course proejct description:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data was originally from the UCI Machine  Learning Reposiory and titled *Human Activity Recognition Using Smartphones Data Set*

A description of the data and link to the original data folder is available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#


##The Variables

### The following is from the features_info.txt file in the data set

**Feature Selection **


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


### The extracted data contains only the data called for by the project instructions:

1) Subject
2) Activity
3) Mean of measurements
4) Standard deviation of measurements


##Work to clean the data

An R prgram titled *run_analysis.R* was used to clean up the data for the purposes of the project.

The original data set breaks up much of the data into seperate text files. For instance, the meansurement data is seperated into training (algorithm training) and testing data. The original data is quite segemented and even the subjects and the data measurement lavbels are recorded in seperate files. Threefore, the program needed to combine various files before extracting the requireed measurements.

The data itself is not transformed in anyway but actions are taken to make the data tidy. 

The program...

1) Downlaods the data from the course data repository
2) Combines the subject, activity and measurement data for the train data
3) Combiees the subject, activity and measurement data for the test data
4) Combines the train and test data into a single file
5) Reads the measurement names from file and applies them as column names for the measurements
6) Reads the activity names and replaces the activity codes in the file with the actual activity names
7) Cuts the data so it contains only the mean and standard deviationmeasurements
8) Writes the resuting data to a TXT file named *ExtractedData.txt*

# End of CodeBook
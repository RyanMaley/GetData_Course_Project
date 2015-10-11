---
title: "README"
author: "Ryan Maley"
date: "October 11, 2015"
output: html_document
---

This document provides information for the Course Project for getedata-032 *Getting and Cleaning Data*

The assignment was to take a provided data set and make it tidy by combining various provided data into a single file.

## Course Project Deliverables


### README
This file.

### CodeBook

A CodeBook describing the variables from the original data set is provided.

### The Script

A single R prgram titled *run_analysis.R* was used to clean up the data for the purposes of the project.

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

# End of README
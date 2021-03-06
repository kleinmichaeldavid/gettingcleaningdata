# README
Mike Klein  
March 25, 2017  

## GETTING AND CLEANING DATA FINAL PROJECT

This repository contains my final project for the Getting and Cleaning Data course on Coursera.

## Explanation of each file.

**run_analysis.R**

This file downloads the raw (untidy) data and tidies it. The steps carried out in the code are detailed in Codebook.md. It carries out the following steps:

Merge the training and test sets into one large table. Add a variable ("Subject") containing the subject number corresponding to each observation. Add a variable ("y") containing the number corresponding to the class of activity being performed. Set the names of the remaining variables to be equal to the names contained in the features.txt file. Update the variable y to contain the names of the classes of activity instead of just a number representing each class. Remove all variables, other than "Subject" and "y", that did not represent either a mean or a standard deviation (i.e. whose names did not contain either the string "mean()" or the string "std()"). Create a second data set with the average of each variavle for each activity and each subject.


**CodeBook.md**

Provides an overview of the raw data as well as the steps taken to tidy the data.

**tidy_data.txt**

The tidy data.

**README.md**

This file is README.md!

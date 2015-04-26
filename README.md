# Cleaning up and summarizing accelerometer data

Repo contains code for tidying data obtained from Galaxy S accelerometer and gyroscope.

Data downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repo consists of a single R script titled run_analysis.R

The R script performs the following operations on the data:

1. Reads train and test datasets and merges them
2. Assigns meaningful variable names to the dataset
3. Extracts only mean and standard deviation measurements for each variable
4. Assigns an activity name to each row of the dataset
5. Creates a new dataset with average of each variable for each subject and each activity
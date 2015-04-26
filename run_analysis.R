# Reading all the train and test files into dataframes
X.train <- read.table("train/X_train.txt")
Y.train <- read.table("train/y_train.txt")
Subject.train <- read.table("train/subject_train.txt")
X.test <- read.table("test/X_test.txt")
Y.test <- read.table("test/y_test.txt")
Subject.test <- read.table("test/subject_test.txt")

#Merging all train dataframes
train <- cbind(X.train, Y.train, Subject.train)
#Merging all test dataframes
test <- cbind(X.test, Y.test, Subject.test)

#Merging train and test dataframes
mergedData <- rbind(train,test)

#Reading features file into a dataframe
features <- read.table("features.txt")

#Assigning meaninful variable names
colnames(mergedData) <- c(as.character(features$V2),"Activity_Id","Subject")

#Extracting only mean and standard deviation data
meanstdcols <- grep("mean\\(\\)|std\\(\\)|Activity_Id|Subject", colnames(mergedData), value=TRUE)
truncData <- mergedData[meanstdcols]

#Reading activity labels file into a dataframe
activity <- read.table("activity_labels.txt")

#Assigning meaninful variable names
colnames(activity) <- c("Activity_Id","Activity_Name")

#Adding descriptive activity names
activityData <- merge(truncData,activity,by="Activity_Id")

#Dropping Activity_Id column
activityData$Activity_Id <- NULL

library("plyr")

#Creating dataset with average of each variable for each activity and each subject
tidyData <- ddply(activityData,.(Subject,Activity_Name),numcolwise(mean,na.rm = TRUE))

#Writing dataset to a file
write.table(tidyData, "tidydata.txt",row.names=FALSE)

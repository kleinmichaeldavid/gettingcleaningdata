

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, "getting_cleaning.zip")

unzip("getting_cleaning.zip")

subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt") #names are in the activity labels file

subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt") #names are in the activity labels file

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("y", "name")

#bind training and testing sets
subject <- rbind(subject.train, subject.test)
X <- rbind(X.train, X.test)
y <- rbind(y.train, y.test)

##add in the subject names and y
data.clean <- cbind(unlist(subject), X, y )

##name the columns using the names in the features file
features <- as.character(unlist(read.table("UCI HAR Dataset/features.txt")[,2]))
names(data.clean) <- c("Subject", features, "y")

##add in activity labels
data.clean$y <- activities$name[match(unlist(y),activities$y)]

#this should be done after merging test and train though ##explain the decision that was made
means.sds <- c(TRUE, grepl("mean\\(\\)", features)|grepl("std\\(\\)", features), TRUE)
data.clean <- data.clean[,means.sds]

##of each of the variables hasnt changed
rownames(data.clean) <- NULL


#####separate set
library(dplyr)

summary.df <- group_by(data.clean,Subject,y) %>%
  summarise_each(funs(mean)) %>%
  as.data.frame

write.table(summary.df, "tidy_data.txt", row.name = FALSE)


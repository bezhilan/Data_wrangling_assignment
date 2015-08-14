# load libraries
# change working directories
setwd("/Users/Barath/Dropbox/data_science/SlideRule/data_wrangling/Git_submission/")

# Install packages and load libraries
install.packages('data.table',repos = "http://cran.rstudio.com")
install.packages('dplyr',repos = "http://cran.rstudio.com")
install.packages('plyr',repos = "http://cran.rstudio.com")

library(data.table)
library(dplyr)
library(plyr)

# First lets load the training and test sets first
test <- read.table('data/test/X_test.txt')
train <- read.table('data/train/X_train.txt')

test_activity <- read.table('data/test/y_test.txt', sep = ' ')
train_activity <- read.table('data/train/y_train.txt', sep = ' ')

test_subject <- read.table('test/subject_test.txt', sep = ' ')
train_subject <- read.table('train/subject_train.txt', sep = ' ')

activity_labels <- read.table('data/activity_labels.txt')
variable_description <- read.table('data/features.txt')
colnames(test_subject) <- c("subject_code")
colnames(train_subject) <- c("subject_code")


# Part 1: Combine the test and training data sets

combined <- rbind(test,train)
combined_subject <- rbind(test_subject,train_subject)
combined_activity <- rbind(test_activity,train_activity)

# Part 2: Extract only the mean and the standard deviation of each measurement

# first change column names to the description 
colnames(combined) <- variable_description$V2
colnames(activity_labels) <- c("activity_number","activity_desc")
colnames(combined_activity) <- c("activity_number")
# First let us remove the duplicated columns
combined <- combined[ , !duplicated(colnames(combined))]

# columns to keep contains mean or std in their variable names
col_to_keep <- grep('mean|std',names(combined))
# now select only those indices
extract <- combined %>% select(col_to_keep)

# PART 3:Use descriptive activity names to name the activities in the data set

combined_activity <- inner_join(combined_activity,activity_labels)
extract$activity_desc <- combined_activity$activity_desc
extract$subject_code <- combined_subject$subject_code

# PART 4 - Appropriately labels the data set with descriptive variable names.
# We already took care of this in line line 37

# PART 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#extract_by_activity_subject <- extract %>% group_by(subject_code,activity_desc) %>% summarize(colwise(mean))

extract_by_activity_subject <- ddply(extract,.(subject_code,activity_desc),numcolwise(mean))

# SAVE data
save(extract,file = 'extract.Rda')
save(extract_by_activity_subject,file = 'extract_by_activity_subject.Rda')
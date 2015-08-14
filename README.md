README 
=============================

Data 
----------- 
"Human Activity Recognition Using Smartphones Data Set" which was originally made available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This dataset is collected from the accelerometers from the Samsung Galaxy S smartphone

More info here 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Goal
-----------

1) Merge the training and the test sets to create one data set.
2) Extract only the measurements on the mean and standard deviation for each measurement.
3) Use descriptive activity names to name the activities in the data set
4) Appropriately label the data set with descriptive variable names.
5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


Files
----------
Folder data: Contains the original dataset (see the readme file within for details)

Run_analysis.R : contains the code to clean the data and perform the 5 tasks required for the assignment (as shown above)

extract.rda : Saved tidy data set after 1,2,3,4 containing only the measurements on the mean and standard deviation for each measurement for the merged data set with descriptive activity/variable names

extract_by_activity_subject.Rda : Saved tidy data set after 5 with the average of each variable for each activity and each subject.

CodeBook.md : describes the variables, the data, and transformation that I performed to clean up the data

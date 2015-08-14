CodeBook : 
=============================

variables loaded from the data
-------------------------------
test: contains the test dataset (2947 x 561)

train: contains the training dataset (7352 x 561)

test_activity: contains the activity code for each row of the test dataset (2947 x 1)

train_activity: contains the activity code for each row of the train dataset (7352 x 1)

test_subject: contains the subject ID for each row of the test dataset (2947 x 1)

train_subject: contains the subject ID for each row of the train dataset (7352 x 1)

activity_labels: relates the activity code with the six descriptions (6 x 2)

variable_description: contains the description of the 561 variables (561 x 2)

Variables obtained by transformation
------------------------------------

combined, combined_subject, combined_activity: obtained by rowbinding the test and train data and then column names are changed to descriptive labels

col_to_keep: indices of the columns that are means and standard deviations

extract: the extracted data set that contains only means and standard deviations; activity description and subject code columns also added to this variable

extract_by_activity_subject: column wise means are calculated after grouping by subject code and activity description using the ddply command



# Getting and Cleaning Data: Week-4_Assignment

This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.
* First, download and unzip the data file into your R working directory.
* Second, download the R source code into your R working directory.
* Finally, execute R source code to generate tidy data file.

### Data Description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### Code explaination
The code combines the training dataset and the test dataset, and extracts only the variables involving the mean and standard devitaion of the data to create another dataset with the averages of each variable for each activity.

### New dataset
The new generated dataset contains only the variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for every subject.

### The code was written based on the instruction of this assignment
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

1. Merge the training and the test sets to create one data set. Use command rbind to combine training and test set and apply appropriate labels.
2. Use descriptive activity names to name the activities in the data set. Convert activity labels to characters and add a new column as factor. 
3. Extract only the measurements on the mean and standard deviation for each measurement. Use grep command to get column index for variable name which contain "mean()" or "std()"
4. Appropriately label the data set with descriptive variable names. Give the selected descriptive names to variable columns.
5. From the data set in step 4, a second, independent tidy data set is created with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

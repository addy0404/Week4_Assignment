library(dplyr)
#fetching all the data from the text files given in the folder
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

variable_names <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#combining test and train data
X_total <- rbind(X_train, X_test)
Y_total <- rbind(y_train, y_test)
Sub_total <- rbind(sub_train, sub_test)

#adding the activity label in front of the activities stored in Y
colnames(Y_total) <- "Activity"
Y_total$ActivityLabel <- factor(Y_total$Activity, labels = as.character(activity_labels[,2]))
ActivityLabel <- Y_total[,-1]

#selecting only the variables which involve std dev and mean and also adding the lables to them
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]
colnames(X_total) <- variable_names[selected_var[,1],2]

#combining the dataset of 66 variables with Activity Label and the subject number
colnames(Sub_total) <- "subject"
total <- cbind(X_total, ActivityLabel, Sub_total)

#taking the mean of each activity of each subject amd write the result in a text file
total_mean <- total %>% group_by(ActivityLabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
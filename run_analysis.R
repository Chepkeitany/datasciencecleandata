# Read in the features
features <- read.table("features.txt")[,2]

# Read in the subject, X, Y test and train data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")


# Merge the training and test sets
metrics <- rbind(x_test, x_train)
subjects <- rbind(subject_test, subject_train)
activities <- rbind(y_test, y_train)

# Apply names function to the metrics
listOfNames <- make.names(features, unique=TRUE)
names(metrics) <- listOfNames

# Extract only the measurements on the mean and standard deviation for each measurement.
columnIndexes = sapply(listOfNames, function(colname){ grepl(colname,  pattern = "\\.std.") | grepl(colname,  pattern = "\\.mean.")})
metrics <- metrics[, columnIndexes]

# Bind the combined data; first the subjects and activities then metrics
data <- cbind(subjects, activities)
names(data) <- c("subject", "activity")
data <- cbind(data, metrics)

# Order the data based on the second column
data <- data[order(data[,2]), ]

# Read the labels (activities) and apply to the second column
labels <- read.table("activity_labels.txt")[,2]
data[,2] <- factor(data[,2], labels = labels)
data[,1] <- factor(data[,1])

# Clean up variable names for activities
# See Codebook.md for description
names(data) <- str_replace_all(names(data), "[.][.]", "")
names(data) <- str_replace_all(names(data), "[.]X", "XAxis")
names(data) <- str_replace_all(names(data), "[.]Y", "YAxis")
names(data) <- str_replace_all(names(data), "[.]Z", "ZAxis")
names(data) <- str_replace_all(names(data), ".mean", "Mean")
names(data) <- str_replace_all(names(data), ".std", "StandardDeviation")
names(data) <- str_replace_all(names(data), "BodyBody", "Body")
names(data) <- str_replace_all(names(data), "tBody", "Body")
names(data) <- str_replace_all(names(data), "fBody", "FFTBody")
names(data) <- str_replace_all(names(data), "tGravity", "Gravity")
names(data) <- str_replace_all(names(data), "fGravity", "FFTGravity")
names(data) <- str_replace_all(names(data), "Acc", "Acceleration")
names(data) <- str_replace_all(names(data), "Gyro", "AngularVelocity")
names(data) <- str_replace_all(names(data), "Mag", "Magnitude")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
summarized_data <- group_by(data, subject, activity) %>% summarise_each(funs(mean))
write.table(summarized_data, row.name=FALSE, file='tidy_dataset.txt')


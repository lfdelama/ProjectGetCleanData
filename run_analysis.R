
##Dataset from UCI Machine Learning Repository##
##Human Activity Recognition Using Smartphones Data set##

#The data is downloaded and unziped in the local working directory 

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, dest = "UCI.zip")
unzip("UCI.zip")

#I list the files to write the paths to the files I want to read

list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/train")
list.files("UCI HAR Dataset/test")

#I read the files for the training set, test set, and list of features, respectively:

trainset <- read.table("UCI HAR Dataset/train/X_train.txt")
testset <- read.table("UCI HAR Dataset/test/X_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Each column, in both training and test sets, is named with the corresponding feature name

var.names <- features$V2
colnames(trainset) <- var.names
colnames(testset) <- var.names

#The training labels are added to the training set.

trainlabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsetlabel <- cbind(trainset, trainlabels)

#The column with the training labels in this datafrane is renamed as "activity"

colnames(trainsetlabel)[colnames(trainsetlabel) == "V1"] <- "activity"

#The test labels are added to the test set

setlabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testsetlabel <- cbind(testset, setlabels)

#The column with the test labels in this dataframe is also renamed as "activity"

colnames(testsetlabel)[colnames(testsetlabel) == "V1"] <- "activity"

#The ID's of the subjects in both training and test sets are added and
# in both cases that new column is renamed as "subject". Prior to this,
# I read the files containing the subject id information

#This is for the training set#
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.lab.sub <- cbind(trainsetlabel, trainsubjects)
colnames(train.lab.sub)[colnames(train.lab.sub) == "V1"] <- "subject"

#This is for the test set#
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.lab.sub <- cbind(testsetlabel, testsubjects)
colnames(test.lab.sub)[colnames(test.lab.sub) == "V1"] <- "subject"

#Up to this point, I have two dataframes, one for the training data and
# another one for the test data. Both of them include columns making reference
# to the subject id, and the code for the activity that was performed.
# Both dataframes also already have descriptive variable names, to which I'll
# make reference few steps later.


##Question 1:Now, both dataframes are merged in one using rbind()

mergeset <- rbind(train.lab.sub, test.lab.sub)

#Just to make sure that there are not Na's in the whole dataframe

sum(is.na(mergeset)) ## No na's


##Question 2: extracting the required columns:

#I decided to extract all the features that were somehow related with a mean.
#This included the mean value of the variable, the mean frequency, and the
#averages applied to the variable angle().
#Please, see attached Codebook and features.info file included with the above 
#mentioned data set, for further information.

meancolumns <- grep("mean", names(mergeset))
Meancolumns <- grep("Mean", names(mergeset))
stdcolumns <- grep("std", names(mergeset))

#I regrouped them in one dataframe

slice <- c(562, 563, meancolumns,Meancolumns,stdcolumns)
mean_std_data <- mergeset[,slice]

##Question 3: addind descriptive activity names

#Up to now, my dataframe only contained the codes related to the activities.
#Through a loop, the descriptive names are added. I decided to keep both 
#codes and descriptive names as I think it can be a more informative table
#containing both.

activity.name <- character()


for (i in 1:length(mean_std_data$activity)){
  
  if(mean_std_data$activity[i] == 1) {
    activity.name <- c(activity.name, "WALKING")
  } else if(mean_std_data$activity[i] == 2) {
    activity.name <- c(activity.name, "WALKING_UPSTARIS")
  } else if(mean_std_data$activity[i] == 3) {
    activity.name <- c(activity.name, "WALKING_DOWNSTAIRS")
  } else if(mean_std_data$activity[i] == 4) {
    activity.name <- c(activity.name, "SITTING")
  } else if(mean_std_data$activity[i] == 5) {
    activity.name <- c(activity.name, "STANDING")
  } else if(mean_std_data$activity[i] == 6) {
    activity.name <- c(activity.name, "LAYING")
  } 
  
}

mean_std_data <- cbind(activity.name,mean_std_data)

##Question 4: Adding descriptive variable names
#Since I had already added the variable names previously (please, see line 24),
# I decided to leave the same feature names as I think they are sufficiently
# descriptive. Please, see the Codebook for further information.


##Question 5: Creating a tidy data set

#I created a molten data frame using melt.data.frame() function,
# and I casted the new dataframe according to subject and activity.
# The average of each measurement is obtained.

melt_df <- melt.data.frame(mean_std_data, id = c("subject", "activity", "activity.name"))
cast_df <- dcast(melt_df, subject + activity + activity.name ~..., mean)

#The columns of the tidy dataframe are renamed. Please, see Codebook for further
#information regarding the new variables

cast_df_names <- colnames(cast_df)
cast_df_names <- cast_df_names[4:length(cast_df_names)]

cast_df_names <- lapply(cast_df_names, FUN= function(x) paste("AVG-", x, sep=""))
cast_df_names <- c("subject", "activity", "activity.name", cast_df_names)


colnames(cast_df) <- cast_df_names

#Final step to write the data back into a text file

write.table(cast_df, file = "TidyData.txt")


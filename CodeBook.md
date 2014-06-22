Assessment Getting and Cleaning Data Codebook 
--------------------------------------------

This codebook is intended for the script related to the above mentioned assessment.
The data was obtained from the project "Human Activity Recognition Using Smartphones Dataset Version 1.0",
and can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* The files used for the assessment purposes (and neccesary for the script) are the following:

   * 'features.txt': List of all features.
   * 'activity_labels.txt': Links the class labels with their activity name.
   * 'train/X_train.txt': Training set.
   * 'train/y_train.txt': Training labels.
   * 'test/X_test.txt': Test set.
   * 'test/y_test.txt': Test labels.
   * 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
   * 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
   

* The features mentioned in the script refered to the variables.

  It is important to mention before describing the variables that the different measurements were recorded using an accelerometer and gyroscope, therefore, generating 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

 Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

 Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were retrieved for further analysis, were the above signals followed by: 

* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

It was also considered the vectors applied to the following variable:

* angle(): Angle between to vectors.

Averaging the signals in a signal window sample and used in the above mentioned variable, there were added dditional variables to the anlysis. The new variables are recognised by the following sufixes:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


Additionally, three more variables are named during the script:

* activity: code from 1 to 6 equivalent to the activity performed during the values measurement.
* activity.name: refers to the activities performed during the values measurement and are as follows:

  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING

* subject: it is a number refering to the subject ID, ranging from 1 to 30

Finally, the variables preceeded by AVG- contain a single value indicating the average of all the values to the corresponding feature.

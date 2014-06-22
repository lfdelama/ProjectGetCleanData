ProjectGetCleanData
===================

This repository is created for the project assessment for the Getting and Cleaning Data course.
The data used is from UCI, related to the study "Human Activity Recognition Using Smartphones Data Set"

This repository contains the following information:

1. The script, named run_analysis.R, with the steps explained to obtain a final tidy data set. The data is assumed to be downloaded and unzipped in the working directory. Briefly explained, the script merges training and study data sets.
This new data set is then reduced to fewer columns (containing either average or standard deviation).
Further steps lead to a tidy data set where the data is ordered by subject id and activity performed, showing 
the average of the values for the features previouly selected.
Finally, this information is write back into a text file

2. A codebook, which provides information regarding the variables used

3. The tidy data set as text file

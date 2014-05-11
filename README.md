#datascience-cleandata
=====================
#Readme File

##Step 1

*Read in train and test datasets from HAR-Dataset
*Merge train and test data sets togther with subject IDs
*Label columns according to features
*Key methods: read.table, cbind, rbind, colnames
*Result: mergedset1

#Step 2 
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Key methods: grep, subset
*Result: mergedset2

#Step 3 and 4
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive activity names.
*Key methods: cbind, labelling 
*Result: mergedset3

#Step 5
*Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
*Key methods: melt, dcast, mean 
*Result: datadcast, project-results.txt

#The repo includes the following files:
=========================================

*README.md
*CODEBOOK.md
*HAR-Dataset
*run_analysis.R
*project-results.txt


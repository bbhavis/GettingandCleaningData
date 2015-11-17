==================================================================
Coursera.org: Getting and Cleaning Data Project
Developed by: Bhavani Balabhadra
Project details: https://class.coursera.org/getdata-034/human_grading/view/courses/975118/assessments/3/submissions
==================================================================

Github link: https://github.com/bbhavis/GettingandCleaningData.git

The project includes the following files:
=========================================
- README.md: Provides the details about the project and files available in the github project repository
- CodeBook.md: Describes the elements/columns present in the data_mean.txt 
- data_mean.txt: Contains the averages of the data for each Subject, Activity and Variable available in UCI HAR Dataset
- run_analysis.R: R program that downloads UCI HAR Dataset, processes the data, derives mean value and generates data_mean.txt file

High-level Requirements:
========================
Using the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data Processing steps:
=====================
On executing the run_analysis.R program flows through the following steps:
1. Checks whether the source file getdata_dataset.zip file exists, if not downloads it
2. Checks if folder UCI HAR Dataset exists, if not, unzips the downloaded file in step#1
3. Read Activity, Features files and Tidy the descriptions
       a. Reading the Activity and Features description files
       b. Tidying the Feature description to adhere to the tidy principles
       c. Replacing all characters ",()-" to blank and also camelcasing "mean" to "Mean" and "std" to "Std" 
4. Merges the training and test datasets and extracts columns ending with mean & std
5. Modifies the column names to descriptive names, adds activity names
6. Reshapes the data using “melt” and calculates the mean for each subject, activity and variable
7. Finally, writes the derived mean in step#6 to a file data_mean.txt using read.table


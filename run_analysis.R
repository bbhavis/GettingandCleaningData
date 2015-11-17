#Loading the libraries "dplyr" & "reshape2" into the session
library(dplyr)
library(reshape2)

#Download the UCI HAR Dataset zip file and unzip if doesn't exist
if (!file.exists("getdata_dataset.zip")) {
    fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl, destfile = "UCIHARDataset.zip", method="curl")
}
if (!file.exists("UCI HAR Dataset")) {
    unzip("./UCIHARDataset.zip")
}

#Reading the Activity and Features description files
#Tidying the Feature description to adhere to the tidy principles
#Replacing all characters ",()-" to blank and also camelcasing "mean" to "Mean" and "std" to "Std"
actLst <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, col.names=c("actNo", "actName"))

ftrLst <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
ftrLst$V3 <-gsub("[,()-]", "", ftrLst[,"V2"])
ftrLst$V3 <- gsub("mean","Mean", ftrLst[,"V3"])
ftrLst$V3 <- gsub("std","Std", ftrLst[,"V3"])
#Identify the fields ending with Mean or Std which will be used later for extracting the elements from the merged dataset
ftrReq <- ftrLst[c(grep("Mean$", ftrLst$V3), grep("Std$", ftrLst$V3)), ]

#The below part of the code handles both the requirements, though it can be done separately. 
#It was combined to do together to optimally use the memory 
#1. Merges the training and test sets to create one data set
#2. Extracts only the measurements on the mean and standard deviation for each measurement
#Loading  files from test folder
datTest <- read.table("./UCI HAR Dataset/test/X_test.txt")[ftrReq[,"V1"]]  #as part of #2 req extracts only required elements
subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE, col.names="subjNo")
actTest <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE, col.names = "actNo")

#Loading files from train folder
datTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")[ftrReq[,"V1"]] #as part of #2 req extracts only required elements
subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE, col.names="subjNo")
actTrain <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE, col.names = "actNo")

#Finally mergining the data read from all the files available in Train & Test folders only
dat <- rbind(cbind(subjTest, actTest, datTest), 
                  cbind(subjTrain, actTrain, datTrain))

#Modifying the column names to meaningfull names
colnames(dat) <- c("subjNo", "actNo", c(ftrReq[,"V3"]))

#3. Uses descriptive activity names to name the activities in the data set
#Merges the Activity list and Data using "actNo" 
#After the merge using select operation drops "actNo" column
dat <- select(merge(actLst, dat, by.x="actNo", by.y="actNo"), -contains("actNo"))

#4. Appropriately labels the data set with descriptive variable names
#Factors the subjNo
dat$subjNo <- as.factor(dat$subjNo)

#Melts the data file by Subject No & Activity
dat.melted <- melt(dat, id=c("subjNo", "actName"))

#5. From the data set in Step#4, creates a second, independent tidey data set with the average of each variable for each activity and each subject
#Derives the mean/average for each Subject, Activity and Variable by using dcast on the melted data (#4)
dat.mean <- dcast(dat.melted, subjNo + actName ~ variable, mean)
#Writes the output to a file for submitting for grading -:)
write.table(dat.mean, file="./UCI HAR Dataset/data_mean.txt", sep="", row.names=FALSE)

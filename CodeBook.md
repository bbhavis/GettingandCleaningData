Feature Selection 
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc and tGyro. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc and tGravityAcc) using another low pass Butterworth filter with a
corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc, fBodyAccJerk, 
fBodyGyro, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

Column Names in data_mean.txt
==============================
1. subjNo: Represents the group of 30 volunteers within an age of 19-48 years
2. actName: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The below list of columns are "Averages" of Mean & Standard Deviation dervied and provided from the source dataset
representing each of the above Subject, Activity and Variable.
3. tBodyAccMagMean
4. tGravityAccMagMean
5. tBodyAccJerkMagMean
6. tBodyGyroMagMean
7. tBodyGyroJerkMagMean
8. fBodyAccMagMean
9. fBodyBodyAccJerkMagMean
10. fBodyBodyGyroMagMean
11. fBodyBodyGyroJerkMagMean
12. angletBodyAccJerkgravityMean
13. angletBodyGyrogravityMean
14. angletBodyGyroJerkgravityMean
15. angleXgravityMean
16. angleYgravityMean
17. angleZgravityMean
18. tBodyAccMagStd
19. tGravityAccMagStd
20. tBodyAccJerkMagStd
21. tBodyGyroMagStd
22. tBodyGyroJerkMagStd
23. fBodyAccMagStd
24. fBodyBodyAccJerkMagStd
25. fBodyBodyGyroMagStd
26. fBodyBodyGyroJerkMagStd

## Code book

The tidy data set consists of a subset of the fields from the ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

### Original Study Design

The UCI HAR data set, upon which our study is based, contains the following description of how the original study was conducted (from its readme.txt):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


### Tidy Data Study Design

#### Recombining the original data set
We downloaded the UCI HAR data set on 2014-12-20. Since the data set is spread over a number of separate files, it was necessary to reassemble it. We combined the subjects, the observations, and the list of activities [using the files subject_*.txt, X_*.txt, and y_*.txt] into a single data.frame, then applied the column names and factored the activity column using the provided activity labels (the features.txt and activity_labels.txt files). We repeated this for both the train and test subsets and then combined the subsets into a final data.frame.

This recombination produces a data set with a number of characterics of tidy data. Each observation is in a single row. Each variable is in a single column. Also, since the train and test subsets are merely subsets of the same kind of data, it is appropriate to combine them into a single table.

#### Removing some columns
To produce the designated subset of only mean and std variables, we removed all columns where the original name did not contain -std or -mean. This method deliberately excludes a number of columns with 'mean' in the name because they are not actually mean values. This includes variables containing "meanFreq" and the variables which begin with "angle." We also retained the subject and activity columns.

#### Tidying up the column names
We have renamed the metrics column names to make them more descriptive and human readable. The codebook contains a number of these transformations.
- The last word(s) indicates the type of metric, **Mean** or **StandardDeviation**
- Next, **FFT** is included, if applicable, to indicate that the measurement had a Fast Fourier Transform (FFT) applied. 
- Either **Body** or **Gravity** is included to indicate the type of signal
- Either **Acceleration** or **AngularVelocity** is included to indicate the type of measurement. "Gyro" is replaced with "AngularVelocity" since that's what the gyroscope is measuring.
- **Jerk** indicates a measure where the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
- **Magnitude** indicates a magnitude calculation
- **XAxis**, **YAxis**, and **ZAxis** indicate a measurement for the X, Y, or Z axis.
#### Summarizing the data
We grouped the data by subject and activity, then calculated the mean of each metric in order to create "a second, independent tidy data set with the average of each variable for each activity and each subject."

### 
The UCI HAR data set's codebook (features_info.txt) describes the original variables this way:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Codebook

* **subject**
  * integer. 1 to 30. The identifier of the study subject.
* **activity**
  * character. The physical activity in which the subject was engaged at the time of the observation. 
    1. WALKING 
    2. WALKING_UPSTAIRS 
    3. WALKING_DOWNSTAIRS 
    4. SITTING 
    5. STANDING 
    6. LAYING
**BodyAccelerationMeanXAxis** - The mean of the body acceleration on the X axis. 

**BodyAccelerationMeanYAxis** - The mean of the body acceleration on the Y axis.

**BodyAccelerationMeanZAxis** - The mean of the body acceleration on the Z axis.

**GravityAccelerationMeanXAxis** - The mean of the gravity acceleration on the X axis.

**GravityAccelerationMeanYAxis** - The mean of the gravity acceleration on the Y axis.

**GravityAccelerationMeanZAxis** - The mean of the gravity acceleration on the Z axis.

**BodyAccelerationJerkMeanXAxis** - The mean of the body acceleration on the X axis, derived in time to obtain Jerk signal

**BodyAccelerationJerkMeanYAxis** - The mean of the body acceleration on the Y axis, derived in time to obtain Jerk signals.

**BodyAccelerationJerkMeanZAxis** - The mean of the body acceleration on the Z axis, derived in time to obtain Jerk signals.

**BodyAngularVelocityMeanXAxis** - The mean of the body angular velocity on the X axis.

**BodyAngularVelocityMeanYAxis** - The mean of the body angular velocity on the Y axis.

**BodyAngularVelocityMeanZAxis** - The mean of the body angular velocity on the Z axis.

**BodyAngularVelocityJerkMeanXAxis** - The mean of the body angular velocity on the X axis, derived in time to obtain Jerk signals.

**BodyAngularVelocityJerkMeanYAxis** - The mean of the body angular velocity on the Y axis, derived in time to obtain Jerk signals.

**BodyAngularVelocityJerkMeanZAxis** - The mean of the body angular velocity on the Z axis, derived in time to obtain Jerk signals.

**BodyAccelerationMagnitudeMean** - The mean of the body acceleration magnitude, calculated using the Euclidean norm.

**GravityAccelerationMagnitudeMean** - The mean of the gravity acceleration magnitude.

**BodyAccelerationJerkMagnitudeMean** - The mean of the body acceleration magnitude derived in time to obtain Jerk signals.

**BodyAngularVelocityMagnitudeMean** - The mean of the angular velocity magnitude.

**BodyAngularVelocityJerkMagnitudeMean** - The mean of the angular velocity magnitude derived in time to obtain Jerk signals.

**FFTBodyAccelerationXAxisMean** - The mean of the body acceleration on the X axis, with a Fast Fourier Transform (FFT) applied

**FFTBodyAccelerationYAxisMean** - The mean of the body acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationZAxisMean** - The mean of the body acceleration on the Z axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationJerkMeanXAxis** - The mean of the body acceleration on the X axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied. 

**FFTBodyAccelerationJerkMeanYAxis** - The mean of the body acceleration on the Y axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationJerkMeanZAxis** - The mean of the body acceleration on the Z axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityMeanXAxis** - The mean of the body angular velocity on the X axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityMeanYAxis** - The mean of the body angular velocity on the Y axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityMeanZAxis** - The mean of the body angular velocity on the Z axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationMagnitudeMean** - The mean of the body acceleration magnitude, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationJerkMagnitudeMean** - The mean of the body acceleration magnitude derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityMagnitudeMean** - The mean of the angular velocity magnitude, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityJerkMagnitudeMean** - The mean of the angular velocity magnitude derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**BodyAccelerationStandardDeviationXAxis** - The standard deviation of the body acceleration on the X axis. 

**BodyAccelerationStandardDeviationYAxis** - The standard deviation of the body acceleration on the Y axis.

**BodyAccelerationStandardDeviationZAxis** - The standard deviation of the body acceleration on the Z axis.

**GravityAccelerationStandardDeviationXAxis** - The standard deviation of the gravity acceleration on the X axis. 

**GravityAccelerationStandardDeviationYAxis** - The standard deviation of the gravity acceleration on the Y axis.

**GravityAccelerationStandardDeviationZAxis** - The standard deviation of the gravity acceleration on the Z axis.

**BodyAccelerationJerkStandardDeviationXAxis** - The standard deviation of the body acceleration on the X axis, derived in time to obtain Jerk signals. 

**BodyAccelerationJerkStandardDeviationYAxis** - The standard deviation of the body acceleration on the Y axis, derived in time to obtain Jerk signals.

**BodyAccelerationJerkStandardDeviationZAxis** - The standard deviation of the body acceleration on the Z axis, derived in time to obtain Jerk signals.

**BodyAngularVelocityStandardDeviationXAxis** - The standard deviation of the body angular velocity on the X axis. 

**BodyAngularVelocityStandardDeviationYAxis** - The standard deviation of the body angular velocity on the Y axis.

**BodyAngularVelocityStandardDeviationZAxis** - The standard deviation of the body angular velocity on the Z axis.

**BodyAngularVelocityJerkStandardDeviationXAxis** - The standard deviation of the body angular velocity on the X axis, derived in time to obtain Jerk signals. 

**BodyAngularVelocityJerkStandardDeviationYAxis** - The standard deviation of the body angular velocity on the Y axis, derived in time to obtain Jerk signals.

**BodyAngularVelocityJerkStandardDeviationZAxis** - The standard deviation of the body angular velocity on the Z axis, derived in time to obtain Jerk signals.

**BodyAccelerationMagnitudeStandardDeviation** - The standard deviation of the body acceleration magnitude, calculated using the Euclidean norm.

**GravityAccelerationMagnitudeStandardDeviation** - The standard deviation of the gravity acceleration magnitude.

**BodyAccelerationJerkMagnitudeStandardDeviation** - The standard deviation of the body acceleration magnitude derived in time to obtain Jerk signals.

**BodyAngularVelocityMagnitudeStandardDeviation** - The standard deviation of the angular velocity magnitude.

**BodyAngularVelocityJerkMagnitudeStandardDeviation** - The standard deviation of the angular velocity magnitude derived in time to obtain Jerk signals.

**FFTBodyAccelerationStandardDeviationXAxis** - The standard deviation of the body acceleration on the X axis, with a Fast Fourier Transform (FFT) applied. 

**FFTBodyAccelerationStandardDeviationYAxis** - The standard deviation of the body acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationStandardDeviationZAxis** - The standard deviation of the body acceleration on the Z axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityJerkStandardDeviationXAxis** - The standard deviation of the body angular velocity on the X axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied. 

**FFTBodyAngularVelocityJerkStandardDeviationYAxis** - The standard deviation of the body angular velocity on the Y axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityJerkStandardDeviationZAxis** - The standard deviation of the body angular velocity on the Z axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityStandardDeviationXAxis** - The standard deviation of the body angular velocity on the X axis, with a Fast Fourier Transform (FFT) applied. 

**FFTBodyAngularVelocityStandardDeviationYAxis** - The standard deviation of the body angular velocity on the Y axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityStandardDeviationZAxis** - The standard deviation of the body angular velocity on the Z axis, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationMagnitudeStandardDeviation** - The standard deviation of the body acceleration magnitude, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAccelerationJerkMagnitudeStandardDeviation** - The standard deviation of the body acceleration magnitude derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityMagnitudeStandardDeviation** - The standard deviation of the angular velocity magnitude, with a Fast Fourier Transform (FFT) applied.

**FFTBodyAngularVelocityJerkMagnitudeStandardDeviation** - The standard deviation of the angular velocity magnitude derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.

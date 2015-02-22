# Getting and Cleaning Data Project Codebook


## Description

The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. This experiment was done to collect data from wearable devices, for helping devlop most advanced algorithm to attarct new users.  
Full description of the data collection from this experiment is available here.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Source
Data is collected fromt he experiment with a group of 30  volunteers within age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data was captured  for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Analysis
Data from the two sets of the source data is merged in a single data set. The measurements on the mean and standard deviation for each measuremnt is extracted from this data set. Subject and activity labels are used to lable each measurement.
Finally, each measurement is grouped by subject, activity and variable. Average value is calculated for each mesaurement.

##Final Data

Final data set has follwoing columns:

* subject : Subject label for each participant
* activity: Activity performed by each participant
* variable: Measurement name for the signals collected in this experiment
* avg_value: Average value for each measurement, activity and subject

The dataset includes the following files:

* README.md 
* tidy_data.txt : Data set created from this project
* Codebook.md : Data set description
* run_analysis.R : R script to process source data

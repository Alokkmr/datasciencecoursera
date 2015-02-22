Q1. Merges the training and the test sets to create one data set.

Download the data in binary form. Unzip the data set using function
 = unzip. The data sets will be in folder named UCI HAR Dataset.

Read the files:
1. X_test.txt
2. X_train.txt
3. subject_test.txt
4. subject_train.txt
5. y_test.txt
6. y_train.txt
Merge the test and train sets using bind_rows() from dplyr().

Load the activity labels in a factor . The factor contains the 
activity names. 

Change the header names of merged y data frame to activity and 
the subject data frame to subject.

Merge all the data set using bind_cols(). 

Q2. Extracts only the measurements on the mean and standard deviation
for each measurement. 

Select the columns that contains the word "mean" and "std". 

Q3. Uses descriptive activity names to name the activities in the 
data set

Use subsetting to change the numeric values in activity set to 
descriptive values in activity set.

Q4.Appropriately labels the data set with descriptive variable names.

 Use the activity names in factor "features" to change the names 
to factor levels in activity_labels.txt

Q5. From the data set in step 4, creates a second, independent tidy
 data set with the average of each variable for each activity and
 each subject.

Use aggregate function to sort the data frame using the subject and
activity columns. use the function mean to sort by average values of
the activities. 
Remove the excess columns and arrange the data frame in ascending 
order w.r.t to subjects. 
Use the gather function from dplyr to make the wide data set into 
a narrow data set. 
Change the long data frames names to Subject, Activity, Measure 
and Value.
Use write.table to make an output tidy_data.txt

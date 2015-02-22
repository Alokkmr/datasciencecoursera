Code Book
1.test_data = data frame made using the read.table function. It 
contains the data set for the test subjects.
2.test_label = data frame made using the read.table function. It 
contains the list of activity names for the test subjects.
3.test_subject = data frame made using the read.table function. It 
contains the list of values by activities each test subjects.
4.train_data = data frame made using the read.table function. It 
contains the data set for the train subjects.
5.train_label = data frame made using the read.table function. It 
contains the list of activity names for the train subjects.
6.train_subject = data frame made using the read.table function. It 
contains the list of values by activities each train subjects.
7.features = A character vector containing the activity names from
the features.txt file using function readLines.
8.data_set = A data frame made by merging the variables 1 & 4.
9.label_set = A data frame made by merging the variables 2 & 5.
10.subject_set = A data frame made by merging the variables 3 & 6.
11.descriptive.data = A data frame made by merging the 
variables 8, 9 & 10. It contains only columns containing mean, std 
,activity and subject
14.x = a data set containing the average values of all the variables
ordered by activity and subject values.
15.clean = a data frame that has excess activity and subject columns
removed from x. It is arranged in ascending order of the variable 
subjects.
16.final = a data frame that transforms wide data set clean into 
narrow data set. Its names are changed to "Subject", "Activity"
, "Measure", "Value" .
code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.m

First of all, data has been downloaded and saved locally. After that, I have set the working directory so that I can easily access the files through a shortened path.
I have red all the needed files and stored them as it follows:

X_test contains all the measured values that are going to be used for testing
y_test contains the numbered action label for the test set
X_train and y_train work similarly as X_test and y_test, but for the training set.
activity_label contains a dataset that links the numbered action label to the named activity label.
features contains all the names for the different features that have been measured
subject_test and subject_train contain the number of the subject that was used to measure the data.

Once I have stored all the variables, I have started to combine them.
First, I have merged the X_train and X_test into the X dataframe.
Similarly, I have done the same with y_train and y_test into the y dataframe.
I have then combined subject_train and subject_test into subject, a dataframe that contains the numbers of the subjects.

Having done that I have combined both the X and y datasets to obtain the "main" dataset.
After that, I have created another column to that dataset, called "subject"

Finally, the Final_DataFrame has been created by subsetting the original one.
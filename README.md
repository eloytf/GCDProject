## GCDProject

### Motivation

This file is created to describe how the script run_analysis.R performs the reading, cleaning and outputting of the required data.


1. Raw data is read

This includes the data itself, the subjects, the labels, the label names, the features. Each subtask is commented in the script.

2. Data is cleaned and merged.

This includes mutating the activity codes to text labels, adding a category variable to indicate if the data is from "training" or "test", adding the subjects and merging the two datasets (training and test).
Some variables are disregarded, to include only mean() and std() variables.
Also, the column names are changed for clarity, and categorical variables moved to the left in the data frame.

3. New dataset is created by aggregation.

Last step consists of summarising by subject-activity pair. The final dataset (gdf) consists of 180 observations (30 subjects x 6 activities). This is written to a text file (dataOutput.txt)



{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab708
\pard\pardeftab708\ri-386\partightenfactor0

\f0\b\fs24 \cf0 The code \'84run_analysis\'93 performs the following steps:\
\
\pard\pardeftab708\ri-386\partightenfactor0

\f1\b0 \cf0 1) install and load useful packages\
2) download and unzip files from https://d396qusza40orc.cloudfront.net/\
    getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip\
3) read data into R\
4) merge training and test data sets and select only std and mean data\
5) label activities in the data set using descriptive names\
6) create a tidy data set with the average of each variable for each activity and each \
    subject and write this data to a text file called \'84tidy_data.txt\'93\
\
}
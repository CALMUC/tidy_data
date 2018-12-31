{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab708
\pard\pardeftab708\ri-386\partightenfactor0

\f0\b\fs24 \cf0 The R script run_analysis is specifically written to process published data from a study on Human Activity Recognition Using Smartphones.\
\
Reference:\
\pard\pardeftab708\ri-386\partightenfactor0

\f1\b0 \cf0 Human Activity Recognition Using Smartphones Dataset\
Version 1.0\
==================================================================\
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.\
Smartlab - Non Linear Complex Systems Laboratory\
DITEN - Universit\'87 degli Studi di Genova.\
Via Opera Pia 11A, I-16145, Genoa, Italy.\
activityrecognition@smartlab.ws\
www.smartlab.ws\
\
The major outcome of \'84run_analysis\'93 are two data frames containing the complete data (\'84all_data\'93) and mean and standard deviation data (\'84tidy_data\'93) derived form all_data.\
\pard\pardeftab708\ri-386\partightenfactor0

\f0\b \cf0 \
\pard\pardeftab708\ri-386\partightenfactor0

\f1\b0 \cf0 In addition to the first and second column, indicating the test person ID and the activity, this person was doing during the measurement (anonymous test persons (ID 1 \'96 30, one per 19 \'96 48 year old volunteer)).\
\
The remaining variable names contain information on the signal domain (frequency or time), the statistical method applied (mean, standard deviation(std)) and the dimension (X, Y or Z axis).\
\
Variable names originate from data collected and pre-processed by the authors of the study:\
The term acceleration in the variable names indicates that data come from the accelerometer, gyro* denotes data from the gyroscope.\
\
Time domain signals were captured at a constant rate of 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. \
Acceleration signals were separated into body and gravity acceleration signals (bodyacc and gravityacc) using a low pass Butterworth filter with a corner frequency of 0.3 Hz. \
\
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (bodyaccjerk and bodygyrojerk). The magnitudes of three-dimensional signals were calculated using the Euclidean norm (bodyaccmag, gravityaccmag, bodyaccjerkmag, bodygyromag, bodygyrojerkmag). \
\
A Fast Fourier Transform (FFT) was applied to some signals producing the frequency domain signals bodyacc, bodyaccjerk, bodygyro, bodyaccjerkmag, bodygyromag, bodygyrojerkmag. \
\
Variable names are liste below:\
 [1] "Subject_ID"                                          \
 [2] "Activity"                                            \
 [3] "TimeBodyAccelerometerMeanX"                          \
 [4] "TimeBodyAccelerometerMeanY"                          \
 [5] "TimeBodyAccelerometerMeanZ"                          \
 [6] "TimeBodyAccelerometerSTDX"                           \
 [7] "TimeBodyAccelerometerSTDY"                           \
 [8] "TimeBodyAccelerometerSTDZ"                           \
 [9] "TimeGravityAccelerometerMeanX"                       \
[10] "TimeGravityAccelerometerMeanY"                       \
[11] "TimeGravityAccelerometerMeanZ"                       \
[12] "TimeGravityAccelerometerSTDX"                        \
[13] "TimeGravityAccelerometerSTDY"                        \
[14] "TimeGravityAccelerometerSTDZ"                        \
[15] "TimeBodyAccelerometerJerkMeanX"                      \
[16] "TimeBodyAccelerometerJerkMeanY"                      \
[17] "TimeBodyAccelerometerJerkMeanZ"                      \
[18] "TimeBodyAccelerometerJerkSTDX"                       \
[19] "TimeBodyAccelerometerJerkSTDY"                       \
[20] "TimeBodyAccelerometerJerkSTDZ"                       \
[21] "TimeBodyGyroscopeMeanX"                              \
[22] "TimeBodyGyroscopeMeanY"                              \
[23] "TimeBodyGyroscopeMeanZ"                              \
[24] "TimeBodyGyroscopeSTDX"                               \
[25] "TimeBodyGyroscopeSTDY"                               \
[26] "TimeBodyGyroscopeSTDZ"                               \
[27] "TimeBodyGyroscopeJerkMeanX"                          \
[28] "TimeBodyGyroscopeJerkMeanY"                          \
[29] "TimeBodyGyroscopeJerkMeanZ"                          \
[30] "TimeBodyGyroscopeJerkSTDX"                           \
[31] "TimeBodyGyroscopeJerkSTDY"                           \
[32] "TimeBodyGyroscopeJerkSTDZ"                           \
[33] "TimeBodyAccelerometerMagnitudeMean"                  \
[34] "TimeBodyAccelerometerMagnitudeSTD"                   \
[35] "TimeGravityAccelerometerMagnitudeMean"               \
[36] "TimeGravityAccelerometerMagnitudeSTD"                \
[37] "TimeBodyAccelerometerJerkMagnitudeMean"              \
[38] "TimeBodyAccelerometerJerkMagnitudeSTD"               \
[39] "TimeBodyGyroscopeMagnitudeMean"                      \
[40] "TimeBodyGyroscopeMagnitudeSTD"                       \
[41] "TimeBodyGyroscopeJerkMagnitudeMean"                  \
[42] "TimeBodyGyroscopeJerkMagnitudeSTD"                   \
[43] "FrequencyBodyAccelerometerMeanX"                     \
[44] "FrequencyBodyAccelerometerMeanY"                     \
[45] "FrequencyBodyAccelerometerMeanZ"                     \
[46] "FrequencyBodyAccelerometerSTDX"                      \
[47] "FrequencyBodyAccelerometerSTDY"                      \
[48] "FrequencyBodyAccelerometerSTDZ"                      \
[49] "FrequencyBodyAccelerometerMeanFrequencyX"            \
[50] "FrequencyBodyAccelerometerMeanFrequencyY"            \
[51] "FrequencyBodyAccelerometerMeanFrequencyZ"            \
[52] "FrequencyBodyAccelerometerJerkMeanX"                 \
[53] "FrequencyBodyAccelerometerJerkMeanY"                 \
[54] "FrequencyBodyAccelerometerJerkMeanZ"                 \
[55] "FrequencyBodyAccelerometerJerkSTDX"                  \
[56] "FrequencyBodyAccelerometerJerkSTDY"                  \
[57] "FrequencyBodyAccelerometerJerkSTDZ"                  \
[58] "FrequencyBodyAccelerometerJerkMeanFrequencyX"        \
[59] "FrequencyBodyAccelerometerJerkMeanFrequencyY"        \
[60] "FrequencyBodyAccelerometerJerkMeanFrequencyZ"        \
[61] "FrequencyBodyGyroscopeMeanX"                         \
[62] "FrequencyBodyGyroscopeMeanY"                         \
[63] "FrequencyBodyGyroscopeMeanZ"                         \
[64] "FrequencyBodyGyroscopeSTDX"                          \
[65] "FrequencyBodyGyroscopeSTDY"                          \
[66] "FrequencyBodyGyroscopeSTDZ"                          \
[67] "FrequencyBodyGyroscopeMeanFrequencyX"                \
[68] "FrequencyBodyGyroscopeMeanFrequencyY"                \
[69] "FrequencyBodyGyroscopeMeanFrequencyZ"                \
[70] "FrequencyBodyAccelerometerMagnitudeMean"             \
[71] "FrequencyBodyAccelerometerMagnitudeSTD"              \
[72] "FrequencyBodyAccelerometerMagnitudeMeanFrequency"    \
[73] "FrequencyBodyAccelerometerJerkMagnitudeMean"         \
[74] "FrequencyBodyAccelerometerJerkMagnitudeSTD"          \
[75] "FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency"\
[76] "FrequencyBodyGyroscopeMagnitudeMean"                 \
[77] "FrequencyBodyGyroscopeMagnitudeSTD"                  \
[78] "FrequencyBodyGyroscopeMagnitudeMeanFrequency"        \
[79] "FrequencyBodyGyroscopeJerkMagnitudeMean"             \
[80] "FrequencyBodyGyroscopeJerkMagnitudeSTD"              \
[81] "FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency" \
}
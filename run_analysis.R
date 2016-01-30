setwd("z:/non-work/professionalDevelopment/dataScience/GettingData/project/")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt",sep="")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt",sep="")


subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")

levmap<-read.table("./UCI HAR Dataset/activity_labels.txt")

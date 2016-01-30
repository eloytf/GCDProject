setwd("z:/non-work/professionalDevelopment/dataScience/GettingData/project/")

#Read sets and labels
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt",sep="")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt",sep="")

#Read subjects
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")

#Read labels mapping to activity names
levmap<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Mutate labels to activity names
ytest[,1]<-sapply(ytest[,1],function(x) levmap[grep(x,levmap[,1]),2])
ytrain[,1]<-sapply(ytrain[,1],function(x) levmap[grep(x,levmap[,1]),2])

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

#read features
feat<-read.table("./UCI HAR Dataset/features.txt",sep="")
feat<-as.data.frame(feat[,-1])


#add names
names(xtrain)<-as.character(feat[,1])
names(xtest)<-as.character(feat[,1])

#add categorical data
xtest$source<-rep(factor("test"))
xtrain$source<-rep(factor("training"))

#add subject
xtest$subject<-subtest[,1]
xtrain$subject<-subtrain[,1]

#bind dataset

df<-rbind(xtrain,xtest)


#test on small dataset

smalldf<-df[sample(10299,30),]

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

#add activity names (step 3)
xtest$activity<-ytest[,1]
xtrain$activity<-ytrain[,1]


#bind dataset (step 1)

df<-rbind(xtrain,xtest)

#select only mean and standard measurements (step 2)

df<-df[,grep("(M|m)ean\\(|(S|s)td\\(|^source$|^subject$|^activity$",names(df))]

# change column names (step 4)

names(df)<-gsub("^t","time",names(df))
names(df)<-gsub("^f","freq",names(df))
names(df)<-gsub("[\\(\\)]","",names(df))
names(df)<-gsub("-([m|s])","\\U\\1",names(df),perl=TRUE)
names(df)<-gsub("-","",names(df))
names(df)<-gsub("Mag(.+)$","\\1Mag",names(df))



#aggregate (step 5)




library(dplyr)


by<-group_by(df,subject,activity)
gdf<-as.data.frame(summarize_each(by,funs(mean),-source))

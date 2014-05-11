###Getting and Cleaning Data Project###
###R Code

###Step 1

datatrainX=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/train/X_train.txt")
datatrainY=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/train/y_train.txt")
datatrainSub=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/train/subject_train.txt")


datatestX=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/test/X_test.txt")
datatestY=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/test/y_test.txt")
datatestSub=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/test/subject_test.txt")

features=read.table("~/Desktop/repos/datascience-cleandata/HAR-Dataset/features.txt")

colnames(datatrainSub)=c("Subject")
colnames(datatrainX)=features$V2
colnames(datatrainY)=c("ActivityClass")

colnames(datatestSub)=c("Subject")
colnames(datatestX)=features$V2
colnames(datatestY)=c("ActivityClass")

mergedtrain1=cbind(datatrainSub,datatrainX,datatrainY)
mergedtest1=cbind(datatestSub,datatestX,datatestY)
mergedset1=rbind(mergedtrain1,mergedtest1)

#Result
mergedset1

###Step 1 Completed
###Step 2 

selectedfeatures=sort(c(grep("mean",features$V2),grep("std",features$V2)))

datatrainXSelected=datatrainX[,selectedfeatures]
datatestXSelected=datatestX[,selectedfeatures]

mergedtrain2=cbind(datatrainSub,datatrainXSelected,datatrainY)
mergedtest2=cbind(datatestSub,datatestXSelected,datatestY)
mergedset2=rbind(mergedtrain2,mergedtest2)

#Result
mergedset2

###Step 2 Completed

###Step 3 and 4

Activity=rep("a",nrow(mergedset2))

for (i in 1:nrow(mergedset2)) {

if (mergedset2[i,81]==1) {Activity[i]="WALKING"}
if (mergedset2[i,81]==2) {Activity[i]="WALKING_UPSTAIRS"}
if (mergedset2[i,81]==3) {Activity[i]="WALKING_DOWNSTAIRS"}
if (mergedset2[i,81]==4) {Activity[i]="SITTING"}
if (mergedset2[i,81]==5) {Activity[i]="STANDING"}
if (mergedset2[i,81]==6) {Activity[i]="LAYING"}

}

mergedset3=cbind(mergedset2,Activity)

#Result
mergedset3

###Step 3 and 4 Completed

###Step 5

library(reshape2)

#selectedfeatures2=sort(c(grep("mean",names(mergedset3)),grep("std",names(mergedset3))))

datamelt=melt(mergedset3,id=c("Subject","ActivityClass","Activity"),measure.vars=names(mergedset3)[2:80])

#Result
datadcast=dcast(datamelt,Subject+ActivityClass+Activity~variable,mean)

write.table(datadcast,file="~/Desktop/repos/datascience-cleandata/project-results.txt",quote=TRUE,sep=",")

###Step 5 Complete





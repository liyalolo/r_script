

setwd("C:/Users/PC1/Desktop/liufan/ko_anova")

files<-dir()
data<-read.table(files[1])
groupfile<-read.table("group")

#View(data)
cnames<-colnames(data)
rnames<-row.names(data)
length(cnames)
length(rnames)

vec<-as.numeric(data[1,])
vec<-as.matrix(vec)
group<-as.factor(groupfile$V2)
levels(group)
tmpaov<-aov(vec~group)
pvalue<-summary(tmpaov)
str(pvalue)
unlist(pvalue)[9]


pvaluelist<-TukeyHSD(aov(vec~group))
pvalue<-pvaluelist$group[,4]



###################################loop for all samples###########################################

maxid<-dim(newtable)[2]

for(i in 2:maxid){
  pvaluelist<-TukeyHSD(aov(newtable[,i]~facgroups))
  pvalue<-pvaluelist$facgroups[,4]
  
  flag=0
  
  if(flag){
    cnames<-colnames(newtable)
    nameid<-cnames[2]
    pvalueset<-c(nameid,pvalue)
    cat(pvalueset)
  }
}










setwd("C:/Users/PC1/Desktop/16s_may/lh")
file<-"spec.txt"
prefix<-"spec"
filename<-paste(prefix,"corr.txt",sep=".")

data<-read.table(file)
x<-as.matrix(data)

library(corrplot)



lowerbound<--0.4
upperbound<-0.4
zero_percentage<-0.1
xcor<-cor(x[,1],x[,2],method="spearman")
rn<-row.names(x)
columnname<-colnames(x)
rownum<-dim(x)[1]
colnum<-dim(x)[2]
writeresult<-matrix(c("sp1","sp2","cor"),1,3)


abundance<-apply(x,2, median)
write.table(abundance,file=paste(prefix,"abun.txt",sep="."),quote=F,sep="\t")
#HFXLeaf.03      HFXSoil.03      HFXShoot.03     HFXWater.03     HFXLeaf.04      HFXSoil.04      HFXShoot.04     HFXWater.04     HFXLeaf.09      HFXS
#4-29    4.18427549269844e-05    0.000417968672252851    0.000264177527298344    0       3.41553384794043e-05    0.000664991872321561    1.6496750140


#write.table("",file="corr.txt")
for(i in 1:(colnum-1)){
  for(j in (i+1):colnum){
    sp1<-x[,i]
    sp2<-x[,j]
    sp1_0percent<-length(which(sp1==0))/rownum
    sp2_0percent<-length(which(sp2==0))/rownum
    if(sp1_0percent<zero_percentage && sp2_0percent<zero_percentage ){
      next;
    }
    
    spearmancor<-cor(sp1,sp2,method="spearman")
    if(spearmancor[1]<lowerbound || spearmancor[1]>upperbound){
      sp1name<-columnname[i]
      sp2name<-columnname[j]
      tuple<-c(sp1name,sp2name,spearmancor[1])
      temp<-matrix(tuple,1,3)
      writeresult<-rbind(writeresult,temp)
    }
  }
}
write.table(writeresult, file=filename,col.names=F,row.names=F,quote=F,sep=" ",append=F)

blood[which(blood$V1=="Alanine"),]


#pdf("spearman.cor.pdf")
#corrplot(xcor,tl.col="black",tl.cex=0.5,mar=c(1,1,1,1))
#dev.off()


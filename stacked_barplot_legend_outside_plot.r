

#install.packages("plspm")

setwd("D:/16s/A707_结果/v2/function")
library(RColorBrewer)
data<-read.table("nitrogen.txt",sep="\t",header=T)
#View(data)
dim(data)
cnames<-colnames(data)
cnames<-cnames[2:36]
nd<-data[,2:36]
row.names(nd)<-data[,1]
#View(nd)
m<-as.matrix(nd)
m<-t(m)

colorselect<-c(brewer.pal(12,"Paired"),brewer.pal(12,"Set3"),brewer.pal(8,"Set2"),
               brewer.pal(9,"Set1"))
#par(las=3,mar = par()$mar + c(0,0,0,4) )
pdf("nitrogen.pdf")
par(las=3,mar=c(6.1, 6.1, 6.1, 20.1))
barplot(m,col=colorselect,border="NA",
        ylab="Relative Abundance",main="Nitrogen Metabolism")
legend(par()$usr[2], mean(par()$usr[3:4]),
       legend=cnames,fill=colorselect,xpd=TRUE, 
       cex=0.5,xjust=0, yjust=0.5,border="white",
       box.col="white")
dev.off()




#tl.cex=0.5,tl.srt=40
#AFAIK, with base graphics, you can only ask for 0/90° orientation of labels on x- or y-axis (see the las parameter in par()). However, with lattice or ggplot2 you can do it.

#Here is an example with lattice::barchart():

tt <- table(sample(LETTERS[1:6], 100, rep=T))
library(lattice)
barchart(tt, horiz=F, 
         scales=list(x=list(rot=45, labels=paste("Fancy label", 1:6))))





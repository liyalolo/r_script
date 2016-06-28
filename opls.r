
library(ropls)
data(sacurine)
names(sacurine)
#dataMatrix, sampleMetadata, variableMetadata


attach(sacurine)
strF(dataMatrix)
#183*109 matrix, metabolites
strF(sampleMetadata)
#age, bmi, gender, 
strF(variableMetadata)
#msilevel, hmdb, chemicalClass, 109 rows*3 columns

#pca
sacurine.pca<-opls(dataMatrix)
genderFc<-sampleMetadata[,"gender"]
plot(sacurine.pca,typeVc="x-score",parAsColFcVn=genderFc, parEllipsesL=TRUE)

#PLS
sacurine.plsda<-opls(dataMatrix, genderFc)

#R2Y, dispersion of Y
#predictive performance of the full model is assessed by the cumulative Q2Y metric, Q2Y=1-MULTIPLE(1-Q2Yh)
#the higher Q2Y, the better performance
#NIPALS, for data with NA


#opls-da
sacurine.oplsda<-opls(dataMatrix,genderFc,predI=1,orthoI=NA)
#gender response
sacurine.oplsda<-opls(dataMatrix, genderFc, predI = 1, orthoI = NA, subset = "odd")
trainVi <- getSubsetVi(sacurine.oplsda)
table(genderFc[trainVi], fitted(sacurine.oplsda))
table(genderFc[-trainVi],predict(sacurine.oplsda, dataMatrix[-trainVi, ]))



#overfitting
set.seed(123)
obsI<-20
featVi<-c(2,20,200)








SLR <- function(filepath=''){
  if(filepath==''){
    Advertising = read.csv('C:/Users/Sanket Shahane/Google Drive/MS/FDS/Homework/HW3/HW23R/HW3/data/hw23R-Advertising.csv')
  }
  else{
    Advertising = read.csv(filepath)
  }
  Advertising = data.frame(Advertising[,2],Advertising[,3],Advertising[,4],Advertising[,5])
  colnames(Advertising) = c('TV','Radio','Newspaper','Sales')
  
  attach(Advertising)
  slr.tv = lm(Sales~TV)
  plot(TV,Sales,col='blue',pch=20)
  abline(slr.tv,lwd=2,col='red')
  
  slr.radio = lm(Sales~Radio)
  plot(Radio,Sales,col='blue',pch=20)
  abline(slr.radio,lwd=2,col='red')
  
  slr.newspaper = lm(Sales~Newspaper)
  plot(Newspaper,Sales,col='blue',pch=20)
  abline(slr.newspaper,lwd=2,col='red')
  
  print(summary(slr.tv))
  print(summary(slr.radio))
  print(summary(slr.newspaper))
}

MLR <- function(filepath=''){
  if(filepath=='')
  {
    Advertising = read.csv('C:/Users/Sanket Shahane/Google Drive/MS/FDS/Homework/HW3/HW23R/HW3/data/hw23R-Advertising.csv')
  }
  else
  {
    Advertising = read.csv(filepath)
  }
  Advertising = data.frame(Advertising[,2],Advertising[,3],Advertising[,4],Advertising[,5])
  colnames(Advertising) = c('TV','Radio','Newspaper','Sales')
  attach(Advertising)
  
  mlr = lm(Sales~TV+Radio+Newspaper)
  
  x = coef(mlr)
  b0 = x[[1]]
  b1 = x[[2]]
  b2 = x[[3]]
  b3 = x[[4]]
  mlr.equation = paste('y=',b0,'+',b1,'*TV+',b2,'*Radio',b3,'*Newspaper')
  print('regression equation')
  print(mlr.equation)
}

LogisticRegression <- function(filepath=''){
	if(filepath==''){
		data = read.table('C:/Users/Sanket Shahane/Google Drive/MS/FDS/Homework/HW3/HW23R/HW3/data/hw23R-q4.txt',header=T)
	}
	else{
		data = read.table(filepath,header=T)
	}
	dataset = na.omit(data)
	head(dataset)

	logisticmodel = glm(Y~X1+X2+X3,data=dataset,family=binomial(link="logit"))
	summary(logisticmodel)
}

LogisticRegressionImproved <- function(filepath=''){
	if(filepath==''){
		data = read.table('C:/Users/Sanket Shahane/Google Drive/MS/FDS/Homework/HW3/HW23R/HW3/data/hw23R-q4.txt',header=T)
	}
	else{
		data = read.table(filepath,header=T)
	}
	dataset = na.omit(data)
	head(dataset)

	model.null = glm(Y~1,data=dataset,family = binomial(link = "logit"))
	model.full = glm(Y~X1+X2+X3,data = dataset,family=binomial(link="logit"))

	step(model.null,scope=list(upper=model.full),direction = "forward",test="Chisq",data=dataset)
	
	print('')
	print('')
	print('From the above output we can see that the model.full has the lowest AIC score and therefore including all the variables X1,X2,X3 gives the best model.')
	print('The best model is:')
	summary(model.full)
}

LogisticRegressionImproved <- function(filepath=''){
  if(filepath==''){
    data = read.table('C:/Users/Sanket Shahane/Google Drive/MS/FDS/Homework/HW3/HW23R/HW3/data/hw23R-q4.txt',header=T)
  }
  else{
    data = read.table(filepath,header=T)
  }
  dataset = na.omit(data)
  head(dataset)
  
  print('Using forward selection to select subset of features:')
  model.null = glm(Y~1,data=dataset,family = binomial(link = "logit"))
  model.full = glm(Y~X1+X2+X3,data = dataset,family=binomial(link="logit"))
  
  step(model.null,scope=list(upper=model.full),direction = "forward",test="Chisq",data=dataset)
  
  print('')
  print('')
  print('From the above output we can see that the model.full has the lowest AIC score and therefore including all the variables X1,X2,X3 gives the best subset selection of features.')
  print('The model using best subset is:')
  print(summary(model.full))
  print("We can try taking the log on X3 as it has the highest p-value.")
  
  model.improved = glm(Y~X1+X2+log(X3),data = dataset,family=binomial(link="logit"))
  print('Comparing it with the previous model using anova')
  print(anova(model.full,model.improved))
  print('We observe that the residual deviance is lower when taking log of X3.')
  
  print('Next analyzing the residual plots  with the help of studres(), we remove the extreme outliers.')
  require(MASS)
  plot(studres(model.full),pch=20,col='red')
  dataimp <- data[-c(52)]
  dataimp <- dataimp[-c(9),]
  logisticmodel.imp = glm(Y~X1+X2+X3,data=dataimp,family=binomial(link="logit"),control = list(maxit=100))
  print(summary(logisticmodel.imp))
  print('We see that the residual deviance is nearly zero for this model. Also this model has an AIC value=8 which is the lowest. Thus this model performs better than the original.')
}
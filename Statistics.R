CoinFlip <- function(){
  set.seed(10000)
  x = sample(0:1,10000,replace=T)
  op.trials = seq(1,length(x),1)
  op.sum = 0
  op.average = 0
  op.avg.array = 0
  for(i in seq(1,length(x),1)){
    op.sum = sum(x[0:i])
    op.average = op.sum / i
    op.avg.array[i] = op.average
  }
  plot(op.trials,op.avg.array, type='l', col='red', main = 'Simulation Law of large number',xlab = 'no of trials',ylab = 'average')
  
  y=0.5
  for(i in seq(0,10000,1)){
    y = c(y,0.5)
  }
  x = seq(0,100001,1)
  abline(y,x)
  return('success')
}

CLT <- function(populationDistribution,sampleSize,numberOfSamples){
  set.seed(150)
  if(populationDistribution == 'uniform'){
    pop.dist = runif(10000)
  }else if(populationDistribution == 'normal'){
    pop.dist = rnorm(10000)
  }else if(populationDistribution == 'exponential'){
    pop.dist = rexp(10000)
  }else{
    return('use proper arguments function implemented for uniform,normal and exponential distribution')
  }
  if(sampleSize<30){return('use proper sampleSize; should be greater than or equal to 30')}
  if(numberOfSamples<100){return('number of samples must be greater than or equal to 100')}
  
  popsample = sample(pop.dist,sampleSize)
  frame2 = data.frame(popsample)
  
  for(x in seq(2,numberOfSamples,1)){
    popsample = sample(pop.dist,sampleSize)
    frame2 = data.frame(frame2,popsample)
  }
  samplemeans = 0
  for(x in seq(1,length(frame2),1)){
    samplemeans[x] = mean(frame2[,x])
  }
  par(mfrow=c(1, 2))
  plot(density(pop.dist),main=populationDistribution)
  plot(density(samplemeans),main = c('Sampling distribution of \n"',populationDistribution,' population distribution"'),xlab = "Range of standard distribution")
  return('success')
}
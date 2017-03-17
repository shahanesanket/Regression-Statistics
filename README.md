# Regression-Statistics
This project implements Liner Regression, Logistic Regression model and model selection methods. Also demonstrates the law of large numbers and Central limit theorem.

1. Regression Models:

   Regression.R implements simple linear regression, multiple linear regression and logistic linear regression. The project uses forward      step wise model selection method to choose the best model based on lowest cross-validated measure AIC along with relevant predictors.
   
   LogistRegressionImproved function further shows the investigation done to further improve the model output (taking log of one of the      predictors and removing extreme outliers by observing the error or residual plots.)
   
   We also show an example of heteroscedasticity in the plot.

2. Law of large numbers and Central Limit Theorem:

   The file Statistics.R implements two function CoinFlip - demonstrates Law of large numbers; and function CLT - demonstrates the central    limit theorem. The output plots show various popultation distributions and their corresponding sampling distribution.
 

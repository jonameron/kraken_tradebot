#this script plots the latest trades

#deriver linear model
linear_model <- lm(FX ~ timestamp, data = trades)
trades["lm"]<- predict(linear_model)
slope <- linear_model$coefficients[2]
ifelse(test = slope>0,yes = print("... positive slope..."),no=print("... negative slope..."))

p <- plot_ly( x = (trades$timestamp-first_timestamp), y = trades$FX, name = 'FX', type = 'scatter', mode = 'lines')%>%
  add_trace(x=(trades$timestamp-first_timestamp),y=trades$lm,name =paste('regr , s=',format(linear_model$coefficients[2],digits=3),sep=""),type ='scatter',evaluation = FALSE)

#returns slope of tail model by fraction, 5 for example for 5th-last quantile
tailslope <- function(quantile) #enter 5 to see fifth quantile
{tailNo <- as.integer(length(trades$FX)/quantile)
tail <- tail(x=trades,n=tailNo)
model <- lm(tail$FX ~ tail$timestamp)
return(model$coefficients[2])
}
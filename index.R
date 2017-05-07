library(curl)
library(jsonlite)
library(Rbitcoin)
library(dplyr)
library(stats)
library(plotly)
source("helper_fn.R")

#set keys
api_key <- 'xy' #can be stored in file
private_key <- 'xy' #can be stored in file
#set keys -- console input for deployment
ask_keys <- function(){
x <- readline("Please set api_key ( print \"public\" for use of public functions only): ")  
ifelse(x=="public",
         yes = {
           print("public mode enabled")
           return("")},
          no = y <- readline("Please set private_key: ")
            )
          return(c(x,y))
}
a <- ask_keys()


#get last download time
r <- read.csv(file = "../R_TradeBot_Kraken/Data/download_times.csv",sep = ";",header = FALSE,col.names = c("id","last"))
snce <- as.character(tail(r$last,n = 1))
#tradeSet <- kraken_PublicFn("Trades?pair=XETHZEUR&since=1494094742768336630")
#tradeSet <- kraken_PublicFn(paste("Trades?pair=XETHZEUR&since=",snce,sep=""))
tradeSet <- kraken_PublicFn("Trades?pair=XETHZEUR") #backup
trades <- as.data.frame(do.call(rbind,tradeSet$XETHZEUR))

colnames(trades) <-c("FX","volume","timestamp","b/s","l/m","NnA")
class(trades$FX) <- "numeric"
class(trades$volume) <- "numeric"
class(trades$timestamp) <- "numeric"
class(trades$`b/s`)="character"
class(trades$`l/m`)="character"
trades <- subset(trades,select=-6)

#times ...
last_timestamp <- as.numeric(trades$timestamp[length(trades$timestamp)])
first_timestamp <- as.numeric(trades$timestamp[1])
period <- function(t="s"){
  p <- last_timestamp-first_timestamp
  switch(t,
        h = p/3600,
        m = p/60,
        s = p)
      }

#plotting ...
linear_model <- lm(FX ~ timestamp, data = trades)
trades["lm"]<- predict(linear_model)
slope <- linear_model$coefficients[2]
ifelse(test = slope>0,yes = print("... positive slope..."),no=print("... negative slope..."))

p <- plot_ly( x = (trades$timestamp-first_timestamp), y = trades$FX, name = 'FX', type = 'scatter', mode = 'lines')%>%
  add_trace(x=(trades$timestamp-first_timestamp),y=trades$lm,name =paste('regr , s=',format(linear_model$coefficients[2],digits=3),sep=""),type ='line',evaluation = FALSE)


#writing data to file
write.table(x = trades,file="../R_TradeBot_Kraken/Data/trades_history.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")

#document last
#document last query
prev_timestamp <- as.numeric(trades$timestamp[length(trades$timestamp)])
write.table(tradeSet$last,file = "../R_TradeBot_Kraken/Data/download_times.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")


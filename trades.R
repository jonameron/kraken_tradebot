#this script downloads the latest trade data
library(curl)
library(jsonlite)
library(Rbitcoin)
library(dplyr)
library(stats)
library(plotly)
source("helper_fn.R")

#set keys (optional)
api_key <- 'xy' #can be stored in file
private_key <- 'xy' #can be stored in file

#get last download time
r <- read.csv(file = "./Data/download_times.csv",sep = ";",header = FALSE,col.names = c("id","last"))
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
#derive trade variable
trades <- subset(trades,select=-6)

#get timestamps
last_timestamp <- as.numeric(trades$timestamp[length(trades$timestamp)])
first_timestamp <- as.numeric(trades$timestamp[1])
period <- function(t="s"){
  p <- last_timestamp-first_timestamp
  switch(t,
         h = p/3600,
         m = p/60,
         s = p)
}

#write latest trade data data to file
write.table(x = trades,file="./Data/trades_history.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")

#write last query timestamp into file
prev_timestamp <- as.numeric(trades$timestamp[length(trades$timestamp)])
write.table(as.character(tradeSet$last),file = "./Data/download_times.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")
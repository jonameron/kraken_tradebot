#setter script for trades, pre-requisite: variable trade is available
#write latest trade data data to file
write.table(x = trades,file="./Data/trades_history.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")

#write last query timestamp into file
prev_timestamp <- as.numeric(trades$timestamp[length(trades$timestamp)])
write.table(as.character(tradeSet$last),file = "./Data/download_log.csv",append = TRUE,col.names = FALSE,sep = ";",dec = ",")
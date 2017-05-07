library(curl)
library(jsonlite)
library(Rbitcoin)


#public API call
kraken_PublicFn<- function(query,R=NULL){x<-market.api.query(market = 'kraken',
                                                             url = paste('https://api.kraken.com/0/public/',query,sep=""),
                                                             req = R)#R=list(pair="",...)
return(x$result)
}

#private API call .... # Example:current_balance <- kraken_PrivateFn('Balance',list(asset='ZEUR'))
kraken_PrivateFn<- function(query,R=NULL){x<-market.api.query(market = 'kraken',
                                                              url = paste('https://api.kraken.com/0/private/',query,sep=""),
                                                              req = R,#R=list(pair="",...)
                                                              key = api_key, secret = private_key
)
return(x$result)
}


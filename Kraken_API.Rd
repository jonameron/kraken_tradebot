\name{Kraken API}
\alias{Kraken API}

\title{Kraken API}
#-------------------------------API--------------------------###
#------------------------------------------------------------###
#------------------------------------------------------------###
#https://www.kraken.com/help/api#example-api-code-python3


# Get server time
# URL: https://api.kraken.com/0/public/Time
# Get asset info
# URL: https://api.kraken.com/0/public/Assets
# Get tradable asset pairs
# URL: https://api.kraken.com/0/public/AssetPairs
# Get ticker information
# URL: https://api.kraken.com/0/public/Ticker
# Get OHLC data
# URL: https://api.kraken.com/0/public/OHLC
# Get order book
# URL: https://api.kraken.com/0/public/Depth
# Get recent trades
# URL: https://api.kraken.com/0/public/Trades
# Get recent spread data
# URL: https://api.kraken.com/0/public/Spread
# Get account balance
# URL: https://api.kraken.com/0/private/Balance
# Get trade balance
# URL: https://api.kraken.com/0/private/TradeBalance
# Get open orders
# URL: https://api.kraken.com/0/private/OpenOrders
# Get closed orders
# URL: https://api.kraken.com/0/private/ClosedOrders
# Query orders info
# URL: https://api.kraken.com/0/private/QueryOrders
# Get trades history
# URL: https://api.kraken.com/0/private/TradesHistory
# Query trades info
# URL: https://api.kraken.com/0/private/QueryTrades
# Get open positions
# URL: https://api.kraken.com/0/private/OpenPositions
# Get ledgers info
# URL: https://api.kraken.com/0/private/Ledgers
# Query ledgers
# URL: https://api.kraken.com/0/private/QueryLedgers
# Get trade volume
# URL: https://api.kraken.com/0/private/TradeVolume
# Add standard order
# URL: https://api.kraken.com/0/private/AddOrder
# Cancel open order
# URL: https://api.kraken.com/0/private/CancelOrder

#-------------------------------API-END----------------------###
#------------------------------------------------------------###
#------------------------------------------------------------###
# 
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/public/Ticker?pair=XXBTZEUR')
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/private/Balance',
#                  key = '', secret = '')
# market.api.query(market = 'bitmarket',
#                  url = 'https://www.bitmarket.pl/api2/',
#                  req = list(method = 'info'),
#                  key = '', secret = '')
# # order book
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/public/Depth?pair=XXBTZEUR')
# # open orders
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/private/OpenOrders',
#                  key = '', secret = '')
# # place order
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/private/AddOrder',
#                  key = '', secret = '',
#                  req = list(pair = 'XXBTZEUR',
#                             type = 'sell',
#                             ordertype = 'limit',
#                             price = 1200, # 1200 eur
#                             volume = 0.1)) # 0.1 btc
# # cancel order
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/private/CancelOrder',
#                  key = '', secret = '',
#                  req = list(txid = 'id_from_open_orders'))
# # trades
# market.api.query(market = 'kraken',
#                  url = 'https://api.kraken.com/0/public/Trades?pair=XXBTZEUR')
# 
# ## End(Not run)

#example transaction:
# 
# market.api.query(market = 'kraken',
#                  +                   url = 'https://api.kraken.com/0/private/AddOrder',
#                  +                   key = api_key, secret = prv_key,
#                  +                   req = list(pair = 'XETHZEUR',
#       +                              type = 'sell',
#       +                              ordertype = 'market',
#       +                              volume = 0.01, trading_agreement = 'agree'))




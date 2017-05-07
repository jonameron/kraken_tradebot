#interface for API-keys

#set keys
api_key <- 'xy' #can be stored in file
private_key <- 'xy' #can be stored in file
#set keys -- console input for deployment
ask_keys <- function(){
  x <- readline("Please set api_key ( keep empty for use of public functions only ): ")  
  ifelse(x=="",
         yes = {
           print("public mode enabled")
           return("")},
         no = y <- readline("Please set private_key: ")
  )
  return(c(x,y))
}
a <- ask_keys()
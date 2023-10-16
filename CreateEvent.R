# Set the working directory
setwd("~/Blag/R_Codes")

# Call the needed libraries
library(httr)
library(dotenv)

# Load our .env file
load_dot_env(file = ".env")

when = paste('{"start_time":', as.numeric(as.POSIXct(paste(Sys.Date(), " ", "14:00:00", sep = ""))), 
                      ',"end_time":', as.numeric(as.POSIXct(paste(Sys.Date(), " ", "16:00:00", sep = ""))), '},')

#Define the body of our call
body = paste('{"title": "Learn R with Nylas",
         "when": ', when, 
         '"location": "Blag\'s Den",
         "calendar_id":"', Sys.getenv("CALENDAR_ID"),
             '", "participants": [
            {
              "email":"', Sys.getenv("GUEST_EMAIL"),
              '","name":"', Sys.getenv("GUEST_NAME"),
            '"}
          ]
        }', sep="")

# Set our API Key or Access Token
api_key <- Sys.getenv("API_KEY_V3")

# Call the Event endpoint
url <- paste("https://api.us.nylas.com/v3/grants/", Sys.getenv("CALENDAR_ID"), "/events?calendar_id=", Sys.getenv("CALENDAR_ID"),sep = "")
result <- POST(url,
               body = body,
               add_headers(Authorization = paste("Bearer", api_key),
                           `Content-Type` = "application/json", Accept = "application/json"))

# Print the response of the call
cat(content(result, 'text', encoding = "UTF-8"))

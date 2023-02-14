# Set the working directory
setwd("~/Blag/R_Codes")

# Call the needed libraries
library(httr)
library(dotenv)

# Load our .env file
load_dot_env(file = ".env")

#Define the body of our call
body = paste('{"title": "Learn R with Nylas",
         "when": {"start_time": 1675864800,
                  "end_time": 1675866600},
         "location": "YOUR LOCATION",
         "calendar_id":"', Sys.getenv("CALENDAR_ID"),
         '", "participants": [
            {
              "email": "YOUR EMAIL",
              "name": "YOUR NAME"
            }
          ]
        }');

# Set our API Key or Access Token
api_key <- Sys.getenv("API_KEY")

# Call the Event endpoint
result <- POST("https://api.nylas.com/events?notify_participants=true",
          body = body,
          add_headers(Authorization = paste("Bearer", api_key),
          `Content-Type` = "application/json", Accept = "application/json"))

# Print the response of the call
cat(content(result, 'text', encoding = "UTF-8"))

# create_events_r

This sample will show you to easily create events using the Events Endpoint API.

## Setup

Install the following packages into RStudio

- httr
- dotenv

### Gather environment variables

You'll need the following values:

```text
API_KEY="<ACCESS_TOKEN>"
CALENDAR_ID="<CALENDAR_ID>"
```

Add the above values to a new `.env` file:

```bash
$ touch .env # Then add your env variables
```

## Usage

Run the app:

```bash
$ source("~/YOUR_FOLDER/CreateEvent.R", echo=TRUE)
```

When you run it, it will display the newly created event


## Learn more

Read the blog post [How to Schedule Events with Any Calendar API](https://www.nylas.com/blog/how-to-schedule-events-with-any-calendar-api/)

Visit our [Nylas Calendar API documentation](https://developer.nylas.com/docs/connectivity/calendar/) to learn more.

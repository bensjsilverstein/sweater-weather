## Project Description
The purpose of this project was to build a backend application to plan road trips that will allow users to see the current weather as well as the forecasted weather at their ending destination.

This app is built using service-oriented architecture. A front-end team or application can communicate with the back-end through the use of this API. The purpose of this project is to expose an API that satisfies a set of provided requirements for a front-end team.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Gems 
- jsonapi-serializer
- figaro 
- faraday
- faker
- bcrypt
- pry
- rspec-rails 
- simplecov
- shoulda-matchers
- capybara
- launchy
- orderly
- vcr
- webmock

## How to Install & Run Tests 
- `Ruby version 2.7.4` and `Rails 5.2.8.1`
- fork and clone this repo to your machine 
- run `$ rails db:{drop, create, migrate, seed}`
- run `$ bundle install `
- run `$ bundle exec figaro install` 
- add a [OpenWeather API key](https://openweathermap.org/api) and [MapQuest API key](https://developer.mapquest.com/) to your `application.yml `
- run `$ bundle exec rspec` for test coverage

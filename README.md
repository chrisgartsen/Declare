# Rails 5.0 Starter template

## Includes
* Support for PostgreSQL 
* Removed coffee script support (problems with x64 environments)
* BCrypt
* Bootstrap (3.3) and fontawesome
* RSpec, including FactoryGirl and Capybara
* Do not autogenerate scaffold helper files

## Config variables

Provide the following environment variables for the database-YML config

* APPLICATION_NAME
* DATABASE_USERNAME
* DATABASE_PASSWORD
* DATABASE_NAME

Used in application.html.erb

```
<head>
  ...
  <title><%= ENV['APPLICATION_NAME'] %></title>
  ...
</head>

```


Used in config.yml

```
development:
  <<: *default
  database: <%= ENV['DATABASE_NAME'] %>_test
```
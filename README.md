# Rails 5.0 Starter template

Inludes:
* Support for PostgreSQL 
* Removed coffee script support (because of problems with x64 environments)
* BCrypt support

## Config variables

Provide the following environment variables for the database-YML config

* DATABASE_USERNAME
* DATABASE_PASSWORD
* DATABASE_NAME

Used in config.yml

```
development:
  <<: *default
  database: <%= ENV['DATABASE_NAME'] %>_test
```
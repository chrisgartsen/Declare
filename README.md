# Rails 5.0 Starter template

Inludes:
* Support for PostgreSQL 


## Config variables

Provide the following environment variables for the database-YML config

*DATABASE_USERNAME
*DATABASE_PASSWORD
*DATABASE_NAME

Used in config.yml

```
development:
  <<: *default
  database: <%= ENV['DATABASE_NAME'] %>_test
```
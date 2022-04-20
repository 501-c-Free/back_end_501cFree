# 501_C_Free
### README

## Table of Contents
- [Overview](#overview)
- [Schema](#schema)
- [Setup](#dev-setup)
- [Endpoints](#json-contract)
- [Technologies](#technologies)
- [Contributors](#contributors)

### <ins>Overview</ins>
Backend application for 501_C_Free to
connects developers and non profits
allows users to authenticate with third party service and consumes 2 apis
utilizes facades, services, serializers and poros design patterns to assist in exposing api endpoints

### <ins>Schema</ins>
This application uses a PostgresQL database to store Customer and Subscription information.
<img width="600" alt="be_schema" src="https://user-images.githubusercontent.com/92329376/164086840-03363d87-9cb2-4fce-8644-10126b9da4e3.png">

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate,seed}`
4. Run test suite locally with `bundle exec rspec` to test
5. (return here to add setup instructions to run locally)

### <ins>Endpoints</ins>
[Endpoints](https://github.com/cdelpone/tea-subscriptions/blob/main/endpoints.md)

### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.4
- Rails 5.2.6

#### Development
[Atom][Atom-img]
![Git][Git-img]
![Github][GitHub-img]
![Markdown][Markdown-img]
![PostgreSQL][PostgreSQL-img]
![Postman][Postman-img]
![Ruby on Rails][Ruby on Rails-img]

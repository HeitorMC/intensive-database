# Intensive Database

The objective of this project is to provide a boilerplate to help us practice some queries and concepts using [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html) and pure SQL using [PostgreSQL](https://www.postgresql.org/docs/current/index.html) as our base.

## Table of Contents
- [Intensive Database](#intensive-database)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Running the project](#running-the-project)
  - [Migrations](#migrations)
  - [Queries](#queries)


## Requirements
- Ruby 3.3.0
- PostgreSQL (recommended >=16)
- Docker and `docker-compose` (optional)

## Running the project

- Running both App and Postgres in Docker

```sh
docker-compose up [-d]

# And to open the Rails Console
docker-compose run --rm app rails c
```

- Running only Postgres in Docker

```sh
docker-compose up db [-d]

# The database credentials are needed to connect to the postgres container
# The easiest way is to define the  DATABASE_URL environment variable
export DATABASE_URL=postgres://postgres:secret_password@localhost

bundle install

bundle exec rails db:create db:setup

bundle exec rails c
```

## Migrations

The project [db/seeds.rb](db/seeds.rb) file contains a script to populate with a randomized number of records in order to test the queries.

There is a list of commented model classes we will use during the exercises. Uncomment them as we go and rerun the `bundle exec rails db:seed` to populate your database.

The project also uses the [faker](https://github.com/faker-ruby/faker) and [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) gems to generate the dummy data.

## Queries

During the workshop, we'll create a few queries and we should add them under the [app/queries/](app/queries/) directory. There we have the [application_query.rb](app/queries/application_query.rb) class, which has a few helper methods, we must implement the `#call` method that executes the query and returns the expected response.

We can write the implementation using the model methods, but it is preferred raw SQL for a better understanding of the concepts (we can convert back and forth later on using the `ApplicationRecord#to_sql` method to see the generated query too)

You shouldn't limit yourself to one way or another, if you have time and are willing, you can implement both and just swap between the implementations in the `#call` method and compare the outputs.

```rb
class ExampleQuery < ::ApplicationQuery
  def call
    execute_query load_query('day_one/complex_query.sql')
  end
end

class OtherExampleQuery < ::ApplicationQuery
  def call
    execute_query 'SELECT id, name FROM people;'
  end
end

class AndYetAnotherQuery < ::ApplicationQuery
  def call
    Person.select(:id, :name).map(&:attributes).to_a
  end
end

class MultipleImplementationsQuery < ::ApplicationQuery
  def call
    return active_record_implementation if options[:ar_implementation]

    raw_sql_implementation
  end

  private

  def active_record_implementation
    # cool implementation
  end

  def raw_sql_implementation
    # even cooler implementation
  end
end
```
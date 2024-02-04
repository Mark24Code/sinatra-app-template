# Sinatra App Template

Lightweight web framework codebase. Just clone and develop on it.

Tech component: Rack+Sinatra+Sequel and default use Postgresql database.

Add rails-like migration command line helpers.

## Openbox Features

### Apps

- [x] Multi Env Configuration
- [x] Multi router DSL base on Rack
- [x] CORS support
- [x] Hot reload
- [x] Custom logger
- [x] ORM base on Sequel

### Tasks

- [x] Rails-like migration helpers
- [x] Test
- [x] Seed

### CI&CD

- [x] Dockerfile

# Start To Use

## Config App

`config/*.config.rb` you can define something here to do boot jobs.

## Database

Setting database environment vars:

```shell
DATABASE_HOST
DATABASE_PORT
DATABASE_NAME
DATABASE_USER
DATABASE_PASSWORD
```

## Rake Tasks

`rake` or `rake -T`

all tasks in `config/tasks`, you can edit by yourself.

## Run server & develop

`rake server:dev`

## Production Server & deploy

`rake server:prod`

you can also use docker

`docker built -t <what your docker image label>  .`

# ORM & Tools

Provide rails-like rake task help you build app quickly.

```
rake db:check                   # Checking for current migrations
rake db:connect                 # Connect database
rake db:console                 # Database Console
rake db:create[database_name]   # Create database
rake db:create_migration[name]  # Create a migration
rake db:drop[database_name]     # Drop database
rake db:ls                      # List database tables
rake db:migrate[version]        # Run migrations
rake db:rollback[version]       # Rollback to migration
rake db:version                 # Prints current schema version
rake docker:push[version]       # Push Docker
rake list                       # List all tasks
rake server:dev                 # Start development server
rake server:prod                # Start production server
rake test                       # Run tests
```

# Project Structure

```
.
├── Dockerfile
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── Rakefile
├── app
│   ├── app.rb
│   ├── middlewares
│   │   ├── sample.middleware.rb
│   │   └── sample_auth.middleware.rb
│   ├── models
│   │   └── sample.model.rb
│   ├── routes
│   │   └── hello.route.rb
│   └── tests
│       └── sample.test.rb
├── config
│   ├── core
│   │   ├── base.rb
│   │   └── connect_sequel.rb
│   ├── cors.rb
│   ├── database.rb
│   ├── logger.rb
│   ├── server.rb
│   └── setting.rb
├── config.ru
├── logs
│   ├── development.log
│   └── production.log
├── migrations
└── tasks
    ├── db.task.rb
    ├── docker.task.rb
    ├── server.task.rb
    └── test.task.rb

```

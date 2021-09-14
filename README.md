# Sinatra App Template

Lightweight web framework codebase. Just clone and develop on it.

Tech component: Rack+Sinatra+Sequel and default use Postgresql database.

Add rails-like migration command line helpers.


## Find helpful rake tasks

`rake` or  `rake -T`

## Run server & develop

`rake server:run`


## Production Server & deploy

`APP_ENV=production  bundle exec rake server:run`

you can also use docker

`docker built -t <what your docker image label>  .`

## Custom server & database

Edit `config.yml`

can change server、database
## Mount different Sinatra web application

Edit `config.ru`

Lark also is Rack application. We can use Rack middlewares.

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
rake list                       # List all tasks
rake seed:all                   # Seed: run all seeds
rake seed:run[seed_name]        # Seed: run seed
rake server:run                 # Run server
rake test                       # Run tests
```


## Openbox Features

### Apps

* [x] Multi Env Configuration
* [x] Multi router DSL base on Rack
* [x] CORS support
* [x] Hot reload
* [x] Custom logger
* [x] ORM base on Sequel'

### Tasks

* [x] Rails-like migration helpers
* [x] Test
* [x] Seed

### CI&CD

* [x] Dockerfile



# Project Structure

```
.
├── Dockerfile # Common Dockerfile
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile # Rake Task Index File.
├── bases # Base configured class. You can make different BaseClasses then reuse them.
│   └── base_controller.rb # You contoller can inherit it or write yourself.
├── config.ru # Application index. You can mount controllers and routes here.
├── configs # You can make different configs for applications
│   └── config.rb # Base config
├── controllers 
│   └── root_controller.rb
├── cores # Inject ENVS and autoloads files, make MVC works
│   ├── 01_config.rb
│   └── bootstrap.rb
├── dbs # Database instances, you can make multi database here
│   ├── default_db.rb
│   └── migrations
├── docs
│   └── good.feature
├── log # Directory for save logs by default
│   └── development.log
├── loggers # Loggers for application
│   └── default_logger.rb
├── public # Public resources
│   └── favicon.svg
├── seeds # Seeds
├── tasks # Rake helpful tasks 
│   ├── db_task.rb
│   ├── seed_task.rb
│   ├── server_task.rb
│   └── test_task.rb
├── tests # Test cases
│   └── test_demo.rb
└── views # views template
    ├── base.erb
    └── root.erb

```
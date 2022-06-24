# Sinatra App Template

Lightweight web framework codebase. Just clone and develop on it.

Tech component: Rack+Sinatra+Sequel and default use Postgresql database.

Add rails-like migration command line helpers.


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


# Start To Use

## InitYourDatabase

Make your own development database first.

e.g
```
echo 'export APP_DATABASE_URL="postgres://postgres:<password>@localhost/postgres"' >> ~/.zshrc
```

## Find helpful rake tasks

`rake` or  `rake -T`

all tasks in `config/tasks`, you can edit by yourself.

## Run server & develop

`rake server:dev`

## Production Server & deploy

`rake server:prod`

you can also use docker

`docker built -t <what your docker image label>  .`

## Custom server & database


You can use DSL to config `Key:Value` , then you application just use.

```ruby
Config::Default.configure do
  set :app_env, ENV.fetch('APP_ENV'){ 'development' }
  set :bind, ENV.fetch('HOST') { '0.0.0.0' }
  set :port, ENV.fetch('PORT') { 3000 }
  set :secrets, ENV.fetch('SECRETS') { 'YOU CANNOT GUESS ME' }
  set :max_threads, ENV.fetch('MAX_THREADS') { 5 }

  set :database_url, ENV['DATABASE_URL']
end

Config::Development.configure do 
  set :database_url, 'ENV['DATABASE_URL']'
end

Config::Test.configure do 
  set :database_url, ENV['DATABASE_URL']
end

Config::Production.configure do 
  # set :database_url, ENV['DATABASE_URL']
end
```

They have an inheritance relationship

```
Development < Default
Test < Default
Production < Default
```


In your code, just use  `Config` directly. `core/bootstrap`  do a work that loaded all necessery mods before your code.

```Ruby
Config.current  # current env configuration

Config::Development.database_url

Config::Development

Config::Development.database_url
```

You can also create your own `Config`  for your single Application:

```ruby
class MyConfig < Config::Base

end

MyConfig.configure do 
  # set :database_url, ENV['DATABASE_URL']
end

```

## Route

Edit routes and controllers in split files.

```ruby
# app/routes/hello.route.rb

App.define_routes do

  get '/' do
    json({
      message: 'hello world'
    })
  end
end
```


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
rake server:run                 # Run development server
rake server:prod                # Run production server
rake test                       # Run tests
```

# Project Structure

```
.
├── Dockerfile
├── Gemfile
├── LICENSE
├── README.md
├── Rakefile
├── config
│   ├── base
│   │   └── base_setting.rb
│   ├── Config.rb
│   ├── database.rb
│   ├── log_man.rb
│   ├── setting.rb
│   └── tasks
│       ├── db.task.rb
│       ├── server.task.rb
│       └── test.task.rb
├── config.ru
├── logs
│   └── development.log
├── app
│   ├── app.rb
│   ├── models
│   │   └── sample.model.rb
│   ├── routes
│   │   └── hello.route.rb
│   └── tests
│       └── demo.test.rb
└── migrations

9 directories, 19 files

```

# Boot

 `config/Config.rb` you can define something here to do boot jobs. 
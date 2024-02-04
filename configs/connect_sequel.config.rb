require "sequel"
# require_relative './log_man'


# environment = Config::Setting.current.app_env
# if environment == "development"
#   DB.sql_log_level = :debug
#   # DB.loggers << Logger.new($stdout)
# end

# Postgresql support extra data type



class App < Sinatra::Base
  # Base default database
  # https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
  DB = Sequel.connect(
    adapter: 'postgres',
    host: settings.database_host,
    port: settings.database_port,
    database: settings.database_name,
    user: settings.database_user,
    password: settings.database_password,
    logger: settings.logger
  )

  if settings.development?
    DB.sql_log_level = :debug
    # DB.loggers << Logger.new($stdout)
  end

  # JSON/JOSNB support
  # https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_rb.html
  DB.extension :pg_json
  DB.wrap_json_primitives = true

  # JSON/JOSNB operation
  # https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_ops_rb.html
  Sequel.extension :pg_json_ops
end

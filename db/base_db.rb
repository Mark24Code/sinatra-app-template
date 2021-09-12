require_relative '../prepare'
require 'tools'
require 'sequel'
require 'log/base_logger'

# Base default database

# https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
DB = Sequel.connect(Tools::db_config('config/base_database.yml')['database_url'], logger: $LOGGER )

if $APP_ENV == 'development'
  DB.sql_log_level = :debug
  DB.loggers << Logger.new($STDOUT)
end


# Postgresql support extra data type

# JSON/JOSNB support
# https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_rb.html
DB.extension :pg_json
DB.wrap_json_primitives = true

# JSON/JOSNB operation
# https://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pg_json_ops_rb.html
Sequel.extension :pg_json_ops 
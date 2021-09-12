require 'db/base_db'

namespace :seed do
  desc "Seed: init data"
  task :init do
    Tools::load_mods('seed')
  end
end

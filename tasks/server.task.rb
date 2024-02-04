namespace :server do
  desc "Start development server"
  task :dev do
    exec("APP_ENV=development RACK_ENV=$APP_ENV bundle exec rerun 'rackup -p 4567 -o 0.0.0.0'")
  end

  desc "Start production server"
  task :prod do
    exec("APP_ENV=production RACK_ENV=$APP_ENV bundle exec rackup -p 4567 -o 0.0.0.0")
  end
end

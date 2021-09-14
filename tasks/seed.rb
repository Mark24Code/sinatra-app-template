namespace :seed do
  desc "Seed: init data"
  task :init do
    seeds_dir = File.expand_path(File.join($PROJECT_DIR, 'seeds'))
    Dir.glob("{#{seeds_dir}}/*.rb").sort.each { |file| require file }
  end
end

namespace :seed do
  desc "Seed: run all seeds"
  task :all do
    seeds_dir = File.expand_path(File.join($PROJECT_DIR, 'seeds'))
    Dir.glob("{#{seeds_dir}}/*.rb").sort.each { |file| require file }
  end

  desc "Seed: run seed"
  task :run, [:seed_name] do |t, args|
    seed_name = args[:seed_name]
    seed_file = File.expand_path(File.join($PROJECT_DIR, 'seeds', seed_name))
    require seed_file
  end
end

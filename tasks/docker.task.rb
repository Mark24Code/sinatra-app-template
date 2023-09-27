namespace :docker do
  desc 'Push Docker'
  task :push, [:version] do |t, args|
    puts "[Message] Before run, you need login"
    version = args[:version]
    puts "Your docker image version:"
    puts version
    # 读取version
    image_path = "path/to/your/docker/image/repo"
    version_label = "#{image_path}:#{version}"
    latest_label = "#{image_path}:latest"
    system("docker build -t #{version_label} .")
    system("docker push #{version_label}")
    system("docker build -t #{latest_label} .")
    system("docker push #{latest_label}")
  end
end

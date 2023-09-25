require "rake/testtask"

desc "Test"
Rake::TestTask.new(:test) do |t|
  # t.libs << "tests"
  # t.libs << "lib"
  t.warning = false
  t.test_files = FileList[File.expand_path("./app/tests/**/*.test.rb")]
end

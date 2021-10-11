require "rake/testtask"

desc "Test"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_files = FileList[File.expand_path(File.join($PROJECT_DIR, "tests/**/test_*.rb"))]
end

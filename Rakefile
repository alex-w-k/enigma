namespace :test do
  task :coverage do
    require 'simplecov'
    SimpleCov.start
    Rake::Task["test"].execute
  end
end

task :default => :test
task :test do
 Dir.glob('./test/*_test.rb').each { |file| require file}
end

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :console do
  require 'irb'
  require 'irb/completion'
  require ::File.expand_path('../config/environment',  __FILE__)
 
  ARGV.clear
  IRB.start
end
require 'bundler'
Bundler.require # requires all gems in Gemfile

$LOAD_PATH.unshift(File.expand_path("app", __dir__))

require 'controllers/task_manager_app'

run TaskManagerApp

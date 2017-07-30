require "bundler/gem_tasks"
require "rake/testtask"
require "daemons"
load File.expand_path("../lib/icecast/stats.rb", __FILE__)

Rake::TestTask.new(:test) do |t|
  ENV["ICECAST_ENV"] = "test"
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

namespace :influx do
  desc "create influxdb database & user"
  task :create do
    influx_config = IceCast.config["influx"]
    database = influx_config["db"]
    name = influx_config["name"]
    password = influx_config["password"]

    influxdb = InfluxDB::Client.new
    influxdb.create_database_user(database, name, password)
  end
end

task :default => :test

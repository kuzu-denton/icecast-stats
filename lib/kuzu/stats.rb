lib = File.expand_path("../../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "yaml"
require "daemons"
require "httparty"
require "httparty"
require "kuzu/config"
require "influxdb"
require "icecast/admin"
require "influxdb/connection"
require "kuzu/stats/version"
require "kuzu/stats/service"

Daemons.run("./lib/kuzu/stats/server.rb")

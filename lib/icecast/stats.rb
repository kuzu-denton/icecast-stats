lib = File.expand_path("../../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "yaml"
require "yaml/store"
require "daemons"
require "httparty"
require "icecast"
require "influxdb"
require "icecast/admin"
require "influxdb/connection"
require "icecast/stats/version"
require "icecast/stats/aggregator"

Daemons.run("#{lib}/icecast/stats/service.rb")

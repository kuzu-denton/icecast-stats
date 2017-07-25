lib = File.expand_path("../../../lib", __FILE__)
CONFIG = File.expand_path("../../../config", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "yaml"
require "daemons"
require "httparty"
require "httparty"
require "influxdb"
require "icecast/admin"
require "kuzu/stats/influx"
require "kuzu/stats/version"
require "kuzu/stats/service"

module KUZU
  module Stats
    def self.config
      @config ||= YAML.load_file("#{CONFIG}/kuzu_stats.yml")
    end
  end
end

Daemons.run("./lib/kuzu/stats/server.rb")

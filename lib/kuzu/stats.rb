lib = File.expand_path("../../../lib", __FILE__)
CONFIG = File.expand_path("../../../config", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "yaml"
require "daemons"
require "kuzu/stats/version"
require "httparty"
require "influxdb"
require "httparty"
require "kuzu/stats/icecast"

module KUZU
  module Stats
    def self.config
      @config ||= YAML.load_file("#{CONFIG}/kuzu_stats.yml")
    end
  end
end

Daemons.run("./lib/kuzu/stats/server.rb")

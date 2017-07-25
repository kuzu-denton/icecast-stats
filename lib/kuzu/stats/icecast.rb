require "httparty"
require "influxdb"
require "ap"

module KUZU
  module Stats
    module IceCast
      STATS_URL = "http://kuzu.stream:8000/admin"

      def self.influxdb
        @influxdb ||= InfluxDB::Client.new "kuzu_stats",
          host: "localhost",
          username: KUZU::Stats.config["influx"]["name"],
          password: KUZU::Stats.config["influx"]["password"]
      end

      def self.kuzu_stats_auth
        @kuzu_stats_auth ||= {
          username: KUZU::Stats.config["kuzu_stats"]["name"],
          password: KUZU::Stats.config["kuzu_stats"]["password"],
        }
      end

      def self.get_current_listeners
        stats = HTTParty.get("#{STATS_URL}/stats", :basic_auth => kuzu_stats_auth)
        listeners = stats["icestats"]["listeners"]
        current_listeners_data = {
          values: { value: listeners.to_i }
        }
        influxdb.write_point("current_listeners", current_listeners_data)
      end

      def self.get_unique_ips
        clients = HTTParty.get("#{STATS_URL}/listclients?mount=/kuzu.mp3", :basic_auth => kuzu_stats_auth)
        ip_count = clients["icestats"]["source"]["listener"].size
        unique_ip_count = { values: { value: ip_count } }
        influxdb.write_point("unique_ips", unique_ip_count)
      end
    end
  end
end

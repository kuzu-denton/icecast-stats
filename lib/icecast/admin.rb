module IceCast
  class Admin
    STATS_URL = "http://kuzu.stream:8000/admin"

    def self.kuzu_stats_auth
      @kuzu_stats_auth ||= {
        username: KUZU::Stats.config["kuzu_stats"]["name"],
        password: KUZU::Stats.config["kuzu_stats"]["password"],
      }
    end

    def self.get_current_listeners
      stats = HTTParty.get("#{STATS_URL}/stats", :basic_auth => kuzu_stats_auth)
      stats["icestats"]["listeners"].to_i
    end

    def self.get_unique_ips
      clients = HTTParty.get("#{STATS_URL}/listclients?mount=/kuzu.mp3", :basic_auth => kuzu_stats_auth)
      clients["icestats"]["source"]["listener"].size
    end
  end
end

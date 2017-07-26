module IceCast
  class Admin
    CONFIG = KUZU.config["kuzu_stats"]

    def self.basic_auth
      @basic_auth ||= {
        username: CONFIG["name"],
        password: CONFIG["password"],
      }
    end

    def self.get_current_listeners
      stats = HTTParty.get("#{CONFIG["url"]}/stats", basic_auth: basic_auth)
      stats["icestats"]["listeners"].to_i
    end

    def self.get_ip_count
      clients = HTTParty.get("#{CONFIG["url"]}/listclients?mount=/kuzu.mp3", basic_auth: basic_auth)
      clients["icestats"]["source"]["listener"].size
    end
  end
end

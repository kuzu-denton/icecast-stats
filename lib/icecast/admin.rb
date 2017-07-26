class IceCast
  class Admin
    CONFIG = IceCast.config["stats"]

    def self.get_current_listeners
      stats = AdminClient.get("/stats")
      stats["icestats"]["listeners"].to_i
    end

    def self.get_ip_count
      clients = AdminClient.get("/listclients?mount=/#{CONFIG["mount"]}")
      clients["icestats"]["source"]["listener"].size
    end

    class AdminClient

      def self.get(path)
        basic_auth = { username: CONFIG["name"], password: CONFIG["password"]}
        HTTParty.get("#{CONFIG["url"]}#{path}", basic_auth: basic_auth)
      end
    end
  end
end

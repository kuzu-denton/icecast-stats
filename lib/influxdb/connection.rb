module InfluxDB
  class Connection
    CONFIG = KUZU.config["influx"]

    def self.client
      @client ||= InfluxDB::Client.new "kuzu_stats",
        host: "localhost",
        username: CONFIG["name"],
        password: CONFIG["password"]
    end

    def self.write_ip_count(ip_count)
      ip_count_data = { values: { value: ip_count } }
      self.client.write_point("unique_ips", ip_count_data)
    end

    def self.write_current_listeners(current_listeners)
      current_listeners_data = { values: { value: current_listeners } }
      self.client.write_point("current_listeners", current_listeners_data)
    end
  end
end

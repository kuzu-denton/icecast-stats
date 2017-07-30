module InfluxDB
  class Connection
    CONFIG = IceCast.config["influx"]

    def self.client
      @client ||= InfluxDB::Client.new CONFIG["db"],
        host: "localhost",
        username: CONFIG["name"],
        password: CONFIG["password"]
    end

    def self.write_ip_count(ip_count)
      ip_count_data = { values: { value: ip_count } }
      InfluxDB::Connection.client.write_point("unique_ips", ip_count_data)
    end

    def self.write_current_listeners(current_listeners)
      current_listeners_data = { values: { value: current_listeners } }
      InfluxDB::Connection.client.write_point("current_listeners", current_listeners_data)
    end

    def self.get_current_listeners
      InfluxDB::Connection.client.query("select * from current_listeners")
    end
  end
end

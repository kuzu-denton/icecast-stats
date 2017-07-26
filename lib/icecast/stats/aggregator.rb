module IceCast::Stats
  class Aggregator
    def self.record_current_listeners
      listeners = IceCast::Admin.get_current_listeners
      InfluxDB::Connection.write_current_listeners(listeners)
    end

    def self.record_unique_ips
      ip_count = IceCast::Admin.get_ip_count
      InfluxDB::Connection.write_ip_count(ip_count)
    end
  end
end

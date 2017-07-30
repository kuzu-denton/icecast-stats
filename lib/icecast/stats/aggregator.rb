module IceCast::Stats
  class Aggregator
    def self.record_current_listeners
      listeners = IceCast::Admin.get_current_listeners
      InfluxDB::Connection.write_current_listeners(listeners)
    end
  end
end

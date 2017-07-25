module KUZU
  module Stats
    module Service
      def self.record_current_listeners
        listeners = IceCast::Admin.get_current_listeners
        Influx.write_current_listeners(listeners)
      end

      def self.record_unique_ips
        ip_count = IceCast::Admin.get_unique_ips
        Influx.write_unique_ips(ip_count)
      end
    end
  end
end
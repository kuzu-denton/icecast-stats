require "forwardable"
require "singleton"

module IceCast::Stats
  class Aggregator
    include Singleton

    class << self
      extend Forwardable
      def_delegators :instance, :record_current_listeners
    end

    def record_current_listeners
      listeners = IceCast::Admin.get_current_listeners
      InfluxDB::Connection.write_current_listeners(listeners)
    end
  end
end

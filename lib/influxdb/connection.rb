require "forwardable"
require "singleton"

module InfluxDB
  class Connection
    include Singleton
    CONFIG = IceCast.config["influx"]

    class << self
      extend Forwardable
      def_delegators :instance, :client, :write_current_listeners, :get_current_listeners
    end

    def client
      @client ||= InfluxDB::Client.new CONFIG["db"],
        host: "localhost",
        username: CONFIG["name"],
        password: CONFIG["password"]
    end

    def write_current_listeners(current_listeners)
      current_listeners_data = { values: { value: current_listeners } }
      client.write_point("current_listeners", current_listeners_data)
    end

    def get_current_listeners
      client.query("select * from current_listeners")
    end
  end
end

class Influx
  def self.connection
    @influxdb ||= InfluxDB::Client.new "kuzu_stats",
      host: "localhost",
      username: KUZU::Stats.config["influx"]["name"],
      password: KUZU::Stats.config["influx"]["password"]
  end

  def self.write_uniqe_ips(ip_count)
    ip_count_data = { values: { value: ip_count } }
    Influx.connection.write_point("unique_ips", ip_count_data)
  end

  def self.write_current_listeners(current_listeners)
    current_listeners_data = { values: { value: current_listeners } }
    Influx.connection.write_point("current_listeners", current_listeners_data)
  end
end

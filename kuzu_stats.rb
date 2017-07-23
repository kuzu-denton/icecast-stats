require "httparty"
require "influxdb"
require "ap"

auth = {:username => ENV["KUZUNAME"], :password => ENV["KUZUPW"]}
username = "admin"
password = "admin"
database = "kuzu_stats"
@influxdb = InfluxDB::Client.new database, host: "localhost", username: username, password: password

while true do
  clients = HTTParty.get("http://kuzu.stream:8000/admin/listclients?mount=/kuzu.mp3", :basic_auth => auth)
  ip_count = clients["icestats"]["source"]["listener"].size
  unique_ip_count = { values: { value: ip_count } }
  ap unique_ip_count
  @influxdb.write_point("unique_ips", unique_ip_count)

  stats = HTTParty.get("http://kuzu.stream:8000/admin/stats", :basic_auth => auth)
  listeners = stats["icestats"]["listeners"]
  current_listeners_data = {
    values: { value: listeners.to_i }
  }
  @influxdb.write_point("current_listeners", current_listeners_data)
  sleep 3
end

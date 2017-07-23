require "httparty"
require "influxdb"
require "ap"

auth = {:username => ENV["KUZUNAME"], :password => ENV["KUZUPW"]}
username = "admin"
password = "admin"
database = "kuzu_stats"
@table     = "current_listeners"
@influxdb = InfluxDB::Client.new database, host: "localhost", username: username, password: password

while true do
  response = HTTParty.get("http://kuzu.stream:8000/admin/stats", :basic_auth => auth)
  listeners = response["icestats"]["listeners"]
  ap listeners
  data = {
    values: { value: listeners }
  }
  @influxdb.write_point(@table, data)
  sleep 3
end

require "minitest/autorun"

class InfluxDB::ConnectionTest < Minitest::Test

  def test_write_ip_count
    ip_count_data = { values: { value: 1000 } }
    InfluxDB::Connection.write_ip_count(ip_count_data)
  end
end

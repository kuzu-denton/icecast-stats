require "minitest/autorun"
require "test_helper"

class InfluxDB::ConnectionTest < Minitest::Test
  def setup
    InfluxDB::Connection.client.delete_series("current_listeners")
  end

  def test_write_get_current_listeners
    InfluxDB::Connection.write_current_listeners(100)
    actual = InfluxDB::Connection.get_current_listeners.first["values"].first["value"]
    assert_equal 100, actual
  end
end

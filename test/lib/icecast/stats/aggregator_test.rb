require "minitest/autorun"
require "test_helper"

class InfluxDB::ConnectionTest < Minitest::Test
  def setup
    InfluxDB::Connection.client.delete_series("current_listeners")
  end

  def test_record_current_listeners
    IceCast::Admin.stub(:get_current_listeners, 200) do
      IceCast::Stats::Aggregator.record_current_listeners
      actual = InfluxDB::Connection.get_current_listeners.first["values"].first["value"]
      assert_equal 200, actual
    end
  end
end

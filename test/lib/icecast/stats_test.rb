require "test_helper"

class IceCast::StatsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::IceCast::Stats::VERSION
  end
end

require "httparty"
require "kuzu/stats/icecast"

module KUZU::Stats
  module Server
    def self.run
      while true do
        KUZU::Stats::IceCast.get_current_listeners
        sleep 3
      end
    end
  end
end

KUZU::Stats::Server.run

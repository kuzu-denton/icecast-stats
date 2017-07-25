module KUZU::Stats
  module Server
    def self.run
      while true do
        KUZU::Stats::Service.record_current_listeners
        sleep 3
      end
    end
  end
end

KUZU::Stats::Server.run

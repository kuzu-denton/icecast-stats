module IceCast::Stats
  module Server
    def self.run
      while true do
        IceCast::Stats::Service.record_current_listeners
        sleep 3
      end
    end
  end
end

IceCast::Stats::Server.run

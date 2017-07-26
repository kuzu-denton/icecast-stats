module IceCast::Stats
  class Service
    def self.run
      while true do
        IceCast::Stats::Aggregator.record_current_listeners
        sleep IceCast.config["stats"]["poll_interval"]
      end
    end
  end
end

IceCast::Stats::Service.run

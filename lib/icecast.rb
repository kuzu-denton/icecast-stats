module IceCast
  def self.config
    @config ||= YAML.load_file("#{File.expand_path("../../config", __FILE__)}/icecast_stats.yml")
    @config[ENV["ICECAST_ENV"] || "development"]
  end
end

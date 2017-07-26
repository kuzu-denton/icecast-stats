class KUZU
  def self.config
    @config ||= YAML.load_file("#{File.expand_path("../../config", __FILE__)}/kuzu_stats.yml")
  end
end

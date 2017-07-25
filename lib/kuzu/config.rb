module KUZU
  CONFIG = YAML.load_file("#{File.expand_path("../../../config", __FILE__)}/kuzu_stats.yml")
end


require "httparty"
require "ap"
auth = {:username => "admin", :password => ENV["KUZUADMIN"]}
response = HTTParty.get("http://kuzu.stream:8000/admin/stats", :basic_auth => auth)
ap response

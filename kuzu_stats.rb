require "httparty"
require "ap"
auth = {:username => ENV["KUZUNAME"], :password => ENV["KUZUPW"]}
response = HTTParty.get("http://kuzu.stream:8000/admin/stats", :basic_auth => auth)
ap response

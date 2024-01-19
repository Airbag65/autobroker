require 'httparty'
require 'json'

class Prices
  def initialize
    @key = File.read("./storage/secret.txt")
    @saved_data_json = "./storage/stock-info.json"
  end

  def call
    ticker = "SMCI"
    url = "https://api.polygon.io/v2/aggs/ticker/#{ticker}/range/1/minute/2023-01-09/2023-01-09?adjusted=true&sort=asc&limit=20&apiKey=#{@key}"
    data = HTTParty.get(url).body
    data = JSON.parse(data)
    File.open(@saved_data_json, "w") do |file|
      JSON.dump(data, file)
    end
  end
end


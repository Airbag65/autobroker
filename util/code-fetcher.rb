require 'httparty'
require 'nokogiri'
require 'json'
class Fetcher

  attr_reader :url, :json_file

  def initialize
    @url = "https://finance.yahoo.com/gainers"
    @json_file = "./storage/stock-codes.json"
    fetch_codes
    save
  end

  def fetch_codes
    raw_finance_data = HTTParty.get(@url).body
    raw_finance_data = Nokogiri::HTML(raw_finance_data).to_s
    @codes = raw_finance_data.scan(/(?<=>)[A-Z]{2,}[^\s<]/).take(5)
  end

  def save
    json_obj = {"codes" => @codes}
    File.open(@json_file, "w") do | file |
      JSON.dump(json_obj, file)
    end
  end

  private :fetch_codes, :save
end
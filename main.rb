require 'open-uri'
require 'httparty'
require 'nokogiri'

raw_finance_data = HTTParty.get("https://finance.yahoo.com/gainers").body
raw_finance_data = Nokogiri::HTML(raw_finance_data).to_s

html_tags_content = raw_finance_data.scan(/(?<=>)[A-Z]{2,}[^\s<]/).take(5)

p html_tags_content
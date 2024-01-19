require_relative 'util/code-fetcher'
require_relative 'util/prices'

Fetcher.new

p = Prices.new
p.call
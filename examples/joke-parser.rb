require 'nokogiri'
require 'open-uri'

url = 'https://www.anekdot.ru/last/mem/'
doc = Nokogiri::HTML(URI.open(url))

text = doc.text
image_sources = doc.css('img').map { |link| link['src'] }

puts "All image sources:"
puts image_sources

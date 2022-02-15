require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'rest-client'



def get_name
  names = []
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  page.xpath('//td[3]').each do |link|
    names << link.text
  end
return names
end


def get_currencies
  currencies = []
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  
  page.xpath('//td[5]').each do |link|
    currencies << link.text.delete('$,').to_f
  end
return currencies
end


def create_hash
  symbol_array = get_name
  currencies_array = get_currencies
  a = []

  symbol_array.each_with_index do |x, y|
    a << {x => (currencies_array) [y]}
  end

  puts a

end

create_hash




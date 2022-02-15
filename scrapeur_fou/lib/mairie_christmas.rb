require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'rest-client'


def get_townhall_urls
array_link = []
   
   page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
 
   page.xpath('//p/a[@class="lientxt"]').each do |link|
       array_link << link["href"][1..-1]
   end

  return array_link
end



def get_townhall_email(urls = get_townhall_urls)
 
  city_email_array = []

  urls.each do |url|
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com#{url}"))
 

  page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').each do |link|
    city_email_array << link.text
 end
  puts city_email_array
  
  end

end

def cities_name
    
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

    name = []
    valedoise_cities = page.xpath('//a[@class=\'lientxt\']')
    valedoise_cities.each do |city|
        name << city.text
    end
   
    return name
    
end

def compo
  # link = get_townhall_urls
  # email = get_townhall_email(url = get_townhall_urls)
  # a = []
  # link.each_with_index do |x, y|
  #   a << {x => (email)[y]}
  # end
  # puts a

  result = Hash[cities_name.zip(get_townhall_urls)]
  final_result = []

  result.each do |name, value|
    final_result << {name => value}

  end
    puts final_result


  return final_result


end

compo






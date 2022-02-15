require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    full_array = []

    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    town = page.xpath('//html/body/div/main/section[1]/div/div/div/h1').text

    full_array << {town => email} 
    puts full_array
    return full_array
end

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    url_array = []

    urls = page.xpath('//*[@class="lientxt"]/@href') 

    urls.each do |url| 
        url = "http://annuaire-des-mairies.com" + url.text[1..-1] 
        url_array << url        
    end
    return url_array
end

def hashes_to_hashes
    full_array = get_townhall_urls 
    full_array.each do |townhall_url| 
        get_townhall_email(townhall_url)
    end
end 


hashes_to_hashes
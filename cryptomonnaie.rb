require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_trade(url)
	

	doc = Nokogiri::HTML(open(url))
	crypto_value = []
	crypto_name = []
	crypto_hash = {}
		
		doc.xpath('//tr/td[@class = "no-wrap currency-name"]/a').each do |node|
			crypto_name << node.text
		end
		
		doc.xpath('//tr/td/a[@class = "price"]').each do |node|
			crypto_value << node.text
		end
		crypto_hash = crypto_name.zip(crypto_value)
  end
   puts crypto_hash
end


crypto_trade('https://coinmarketcap.com/all/views/all/')
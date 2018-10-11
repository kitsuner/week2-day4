require 'rubygems'
require 'nokogiri'
require 'open-uri'



def nom_prenom_deputes(url)
	noms = []
	mails = []
	depute_hash = {}

	doc = Nokogiri::HTML(open(url))
	doc.xpath('//*[@id="deputes-list"]//li/a').each do |node|	
		noms << node.text
		adresse = "http://www2.assemblee-nationale.fr" + node['href']
		mails << mail_deputes(adresse)
	end

	noms.each {|i| depute_hash[i] = mails[noms.index(i)]}

	puts depute_hash

end

def mail_deputes(url)

	doc = Nokogiri::HTML(open(url))
	doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a').each do |node|	
		mail =  node['href'][7..-1]
		return mail.to_s
	end

end

nom_prenom_deputes("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
mail_deputes("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719866")
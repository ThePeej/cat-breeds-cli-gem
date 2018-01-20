class CatBreeds::Scraper

	def self.scrape_index(url)
		cat_breeds = []
		doc = Nokogiri::HTML(open(url))
		# binding.pry
		breeds = doc.css("#hub-breed-list-container ul li a")
		breeds.each do |b|
			breed = {}
			breed[:name] = b.text
			breed[:page_url] = b.attr("href")
			cat_breeds << breed
		end
		cat_breeds
	end

	def self.scrape_profile(url)
		breed = {}
		doc = Nokogiri::HTML(open(url))
		breed[:blurb] = doc.css("#breed-detail p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:fun_fact] = doc.css(".interesting-breed-fact p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:overview] = doc.css("#overview .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:history] = doc.css("#history .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:personality] = doc.css("#personality .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:health] = doc.css("#health .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:grooming] = doc.css("#grooming .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed
	end


end
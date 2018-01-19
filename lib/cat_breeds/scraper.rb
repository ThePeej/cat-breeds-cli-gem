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

end
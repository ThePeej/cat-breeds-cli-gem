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
		breed[:description] = doc.css("#overview .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:history] = doc.css("#history .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:personality] = doc.css("#personality .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:health] = doc.css("#health .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:grooming] = doc.css("#grooming .richtext  p").text.gsub("\n","").gsub("\t","").gsub("\r","").strip
		breed[:characteristics] = scrape_characteristics(url)
		breed
	end

	def self.scrape_characteristics(url)
		characteristics = {}
		doc = Nokogiri::HTML(open(url))


		keys = []
		doc.css("td.title").each {|key| keys << key.text.scan(/\A(\w+\s?\w+)/)[0][0].gsub(" ","_")}
		values = []
		doc.css("td.rating").each{|value| values << value.text}
		keys.each_with_index do |key,i|
			characteristics[key.to_sym] = values[i]
		end
		characteristics.sort_by{|k,v|k}
		# Hash[characteristics.sort_by{|k,v|k}]
	end


end
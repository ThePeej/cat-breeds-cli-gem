class CatBreeds::Cat
	attr_accessor :name, :page_url, :blurb, :fun_fact, :description, :history, :personality, :health, :grooming, :characteristics

	@@all = []

	def initialize(name, page_url)
		@name = name
		@page_url = page_url
		self.class.all << self
	end

	def add_details(details) #takes hash returned from CatBreeds::Scraper.scrape_profile(url) and adds breed data to the corresponding instance of cat breed
		details.each do |k,v|
			self.send("#{k}=", v)
		end
	end

	def self.all
		@@all
	end

end
class CatBreeds::CLI

	# BASE_PATH = "https://www.purina.com/cats/cat-breeds"
	BASE_PATH = "http://www.vetstreet.com/"

	def call
		puts "Cats are neat! Check out all the different cat breeds!"
		make_cats
	end

	def make_cats
		breeds_array = CatBreeds::Scraper.scrape_index(BASE_PATH + "/cats/breeds")
		# breeds_array.each do |breed|
			
	end

end
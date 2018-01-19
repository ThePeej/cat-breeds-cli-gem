class CatBreeds::CLI

	# BASE_PATH = "https://www.purina.com/cats/cat-breeds"
	BASE_PATH = "http://www.vetstreet.com/"

	def call
		puts "Cats are neat! Check out all the different cat breeds!"
		make_cats
		binding.pry
	end

	def make_cats
		breeds_array = CatBreeds::Scraper.scrape_index(BASE_PATH + "/cats/breeds")
		breeds_array.each do |breed|
			CatBreeds::Cat.new(breed[:name], breed[:page_url])
		end
	end

end
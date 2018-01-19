class CatBreeds::CLI

	# BASE_PATH = "https://www.purina.com/cats/cat-breeds"
	BASE_PATH = "http://www.vetstreet.com"

	def call
		puts ""
		puts "Cats are neat! Check out all the different cat breeds!"
		cat_breeds = make_cats
		list_cats(cat_breeds)
		prompt
		goodbye
	end

	def make_cats
		breeds_array = CatBreeds::Scraper.scrape_index(BASE_PATH + "/cats/breeds")
		breeds_array.collect do |breed|
			CatBreeds::Cat.new(breed[:name], breed[:page_url])
		end
	end

	def list_cats(cat_breeds)
		puts ""
		cat_breeds.each.with_index(1) do |b,i|
			puts "#{i}. #{b.name}"
		end
	end

	def prompt
		cat = nil
		puts ""
		puts "Enter the cat breed or number that you would like to learn more about:"
		input = gets.strip
		view_breed(CatBreeds::Cat.all[input.to_i - 1])	
	end

	def view_breed(breed)
		details = CatBreeds::Scraper.scrape_profile_overview(BASE_PATH + breed.page_url)
		breed.add_details(details)
		binding.pry
	end


	def goodbye
		puts ""
		puts "Cat's rule!"
		puts ""
	end

end
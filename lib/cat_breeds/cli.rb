class CatBreeds::CLI

	# BASE_PATH = "https://www.purina.com/cats/cat-breeds"
	BASE_PATH = "http://www.vetstreet.com"

	def start
		puts ""
		puts "Cats are neat! Check out all the different cat breeds!"
		cat_breeds = make_cats
		list_cats(cat_breeds)
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
		cat_breeds.each.with_index(1) {|b,i|puts "#{i}. #{b.name}"}
		puts ""
		puts "Enter the cat breed or number that you would like to learn more about:"
		input = gets.strip
		view_breed_overview(CatBreeds::Cat.all[input.to_i - 1])
	end

	def view_breed_overview(breed)
		details = CatBreeds::Scraper.scrape_profile(BASE_PATH + breed.page_url)
		breed.add_details(details)
		puts ""
		puts "----------------------------------------"
		puts "Overview of the #{breed.name}!"
		puts "----------------------------------------"
		puts ""
		puts "#{breed.blurb}"
		puts ""
		puts "Fun Fact!"
		puts "#{breed.fun_fact}"
		puts ""
		view_more_details(breed)
	end

	def view_more_details(breed)
		puts "Learn more about the #{breed.name}"
		puts "[1] History"
		puts "[2] Personality"
		puts "[3] Grooming"
		puts "[4] Health"
		puts "[5] [Back] to list of all cat breeds"
		input = gets.strip
		topic = nil
		info = nil
		case input.downcase
		when "1","history"
			topic = "History"
			info = breed.history
		when "2","personality"
			topic = "Personality"
			info = breed.personality
		when "3","grooming"
			topic = "Grooming"
			info = breed.grooming
		when "4","health"
			topic = "Health"
			info = breed.health
		when "5", "back"
			start
		when "exit"
			goodbye
		else
			puts "Invalid Input. Please try again."
			view_more_details(breed)
		end
		puts ""
		puts "----------------------------------------"
		puts "#{topic}"
		puts "----------------------------------------"
		puts ""
		puts "#{info}"
		puts ""
		puts "[1] Learn more about the #{breed.name}"
		puts "[2] Learn about a different cat breed"
		puts "[exit]"
		input = gets.strip
		case input.downcase
		when "1"
			view_more_details(breed)
		when "2","personality"
			start
		when "exit"
			goodbye
		else
			puts "Invalid Input. Please try again."
		end

	end

	def goodbye
		puts ""
		puts "Cat's rule! See ya!"
		puts ""
	end

end
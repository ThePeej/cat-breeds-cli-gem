class CatBreeds::CLI

	# BASE_PATH = "https://www.purina.com/cats/cat-breeds"
	BASE_PATH = "http://www.vetstreet.com"

	def start
		puts ""
		puts "Cats are neat! Check out all the different cat breeds!"
		breeds = make_cats
		list_cats(breeds)
	end

	def make_cats
		breeds_array = CatBreeds::Scraper.scrape_index(BASE_PATH + "/cats/breeds")
		breeds_array.collect do |breed|
			CatBreeds::Cat.new(breed[:name], breed[:page_url])
		end
	end

	def list_cats(breeds)
		puts ""
		breeds.each.with_index(1) {|b,i|puts "[#{i}] #{b.name}"}
		puts "[exit]"
		puts ""
		puts "Enter the cat breed or number that you would like to learn more about:"
		input = gets.strip
		if input.to_i > 0
			view_breed_overview(CatBreeds::Cat.all[input.to_i - 1])
		elsif CatBreeds::Cat.all.detect{|breed|breed.name.downcase == input.downcase}
			view_breed_overview(CatBreeds::Cat.all.detect{|breed| breed.name.downcase == input.downcase})
		elsif input.downcase == "exit"
			self.goodbye
		else
			puts ""
			puts "Invalid Input. Please try again."
			self.list_cats(breeds)
		end
	end

	def view_breed_overview(breed)
		details = CatBreeds::Scraper.scrape_profile(BASE_PATH + breed.page_url)
		breed.add_details(details)
		puts ""
		puts "----------------------------------------"
		puts "Overview of the #{breed.name}"
		puts "----------------------------------------"
		puts ""
		puts "#{breed.blurb}"
		puts ""
		puts "Fun Fact!"
		puts "#{breed.fun_fact}"
		view_more_details(breed)
	end

	def view_more_details(breed)
		puts ""
		puts "Learn more about the #{breed.name}:"
		puts "[1] Description"
		puts "[2] History"
		puts "[3] Personality"
		puts "[4] Grooming"
		puts "[5] Health"
		puts "[Back] to list of all cat breeds"
		input = gets.strip
		topic = nil
		info = nil
		case input.downcase
		when "1","description"
			topic = "Description"
			info = breed.description
		when "2","history"
			topic = "History"
			info = breed.history
		when "3","personality"
			topic = "Personality"
			info = breed.personality
		when "4","grooming"
			topic = "Grooming"
			info = breed.grooming
		when "5","health"
			topic = "Health"
			info = breed.health
		when "back"
			start
		when "exit"
			goodbye
		else
			puts ""
			puts "Invalid Input. Please try again."
			view_more_details(breed)
		end
		view_topic(breed, topic, info)

	end

	def view_topic(breed, topic, info)
		puts ""
		puts "----------------------------------------"
		puts "#{breed.name} - #{topic}"
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
			puts ""
			puts "Invalid Input. Please try again."
			view_topic(topic, info)
		end
	end

	def goodbye
		puts ""
		puts "Cat's rule! See ya!"
		puts ""
		exit
	end

end
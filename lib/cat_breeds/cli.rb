class CatBreeds::CLI

	BASE_PATH = "http://www.vetstreet.com"

	def start
		puts ""
		puts "----------------------------------------"
		puts "               CAT BREEDS               "
		puts "----------------------------------------"
		breeds = make_cats
		@i = 0
		@j = 9
		list_cats(breeds)
	end

	def make_cats #Scrapes site index page to gather all of the breeds and breed urls
		breeds_array = CatBreeds::Scraper.scrape_index(BASE_PATH + "/cats/breeds")
		breeds_array.collect do |breed|
			CatBreeds::Cat.new(breed[:name], breed[:page_url])
		end
	end

	def list_cats(breeds) #indexes through array of cat breeds returned from make_cats and lists each one for user to select from
		puts ""
		breeds[@i..@i+@j].each.with_index(@i + 1) {|b,i|puts "[#{i}] #{b.name}"}
		puts "[all]" if @j != 49
		puts "[next]" if @i == 0 && @j == 9
		puts "[back||next]" if @i >= 10 && @i+@j <49
		puts "[back]" if @i+@j >= 49 && @j == 9
		puts ""
		puts "type [exit] at any time to close"
		puts ""
		puts "Enter the cat breed or number that you would like to learn more about:"
		input = gets.strip
		if input.to_i > 0 && input.to_i <= breeds.length
			view_breed_overview(CatBreeds::Cat.all[input.to_i - 1])
		elsif CatBreeds::Cat.all.detect{|breed|breed.name.downcase == input.downcase}
			view_breed_overview(CatBreeds::Cat.all.detect{|breed| breed.name.downcase == input.downcase})
		elsif input.downcase == "all"
			@i = 0
			@j = 49
			list_cats(breeds)
		elsif input.downcase == "next" && @i+@j == 49
			puts ""
			puts "That's all the cat breeds!"
			list_cats(breeds)
		elsif input.downcase == "next"
			@i += 10
			list_cats(breeds)
		elsif input.downcase == "back" && @i == 0
			puts ""
			puts "That's all the cat breeds!"
			list_cats(breeds)
		elsif input.downcase == "back"
			@i -= 10
			list_cats(breeds)
		elsif input.downcase == "exit"
			self.goodbye
		else
			puts ""
			puts "Invalid Input. Please try again."
			self.list_cats(breeds)
		end
	end

	def view_breed_overview(breed) #upon selecting a specific cat breed, this method scrapes that breed's url page for more information
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

	def view_more_details(breed) #after more info is scraped from view_breed_overview, more options are presented to learn more about breed
		puts ""
		puts "Learn more about the #{breed.name}:"
		puts "[1] Description"
		puts "[2] Characteristics"
		puts "[3] History"
		puts "[4] Personality"
		puts "[5] Grooming"
		puts "[6] Health"
		puts "[Back] to list of all cat breeds"
		input = gets.strip
		topic = nil
		info = nil
		case input.downcase
		when "1","description"
			topic = "Description"
			info = breed.description
		when "2","characteristics"
			topic = "Characteristics"
			info = Proc.new{
				i = 0
				while i < breed.characteristics.length
					puts "#{breed.characteristics[i][0]}: #{breed.characteristics[i][1]}"
					i += 1
				end
				}
		when "3","history"
			topic = "History"
			info = breed.history
		when "4","personality"
			topic = "Personality"
			info = breed.personality
		when "5","grooming"
			topic = "Grooming"
			info = breed.grooming
		when "6","health"
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

	def view_topic(breed, topic, info) #once specific topic is selected, more information on that topic is presented to the user
		puts ""
		puts "----------------------------------------"
		puts "#{breed.name} - #{topic}"
		puts "----------------------------------------"
		puts ""
		if info.is_a?(String)
			puts "#{info}"
		else 
			info.call
		end
		puts ""
		puts "[1] Learn more about the #{breed.name}"
		puts "[2] Learn about a different cat breed"
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
			view_topic(breed, topic, info)
		end
	end

	def goodbye #upon exiting the program, the user is presented a thank you and cat artwork
		puts ""
		puts "Thanks for learning about cats!"
		puts ""
		puts "        _                        "
        puts "        \\`*-.                    "
        puts "         )  _`-.                 "
        puts "        .  : `. .                "
        puts "        : _   '  \\               "
        puts "        ; *` _.   `*-._          "
        puts "        `-.-'          `-.       "
        puts "          ;       `       `.     "
        puts "          :.       .        \\    "
        puts "          . \\  .   :   .-'   .   "
        puts "          '  `+.;  ;  '      :   "
        puts "          :  '  |    ;       ;-. "
        puts "          ; '   : :`-:     _.`* ;"
        puts " [bye] .*' /  .*' ; .*`- +'  `*' "
        puts "       `*-*   `*-*  `*-*'        "
		puts ""
		exit
	end

end
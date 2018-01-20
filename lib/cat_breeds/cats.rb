class CatBreeds::Cat
	attr_accessor :name, :page_url, :blurb, :fun_fact, :overview, :history, :personality, :health, :grooming

	@@all = []

	def initialize(name, page_url)
		@name = name
		@page_url = page_url
		self.class.all << self
	end

	def add_details(details)
		details.each do |k,v|
			# binding.pry
			self.send("#{k}=", v)
		end
	end



	def self.all
		@@all
	end

end
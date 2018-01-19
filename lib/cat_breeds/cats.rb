class CatBreeds::Cat
	attr_accessor :name, :page_url, :size, :coat, :color, :description, :fun_fact, :similar

	@@all = []

	def initialize(name, page_url)
		@name = name
		@page_url = page_url
		self.class.all << self
	end

	def add_or_view_details

	end



	def self.all
		@@all
	end

end
class Movie

	def initialize(title, comments = [])
		@title = title
		@comments = comments
	end

	def title
		@title
	end

	def comments
		@comments
	end

	def add_comment(user,comment)
		comments << [user,comment]
	end

		
end

class Catalog

	def initialize
		@movies = []
	end

	def movies
		@movies
	end

	def add(movie)
		@movies << movie
	end

	def users_comented (movie)

		users = []


	end



end


 
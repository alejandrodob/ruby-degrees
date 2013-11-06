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

	def users_commented(movie_title)
		users = []
		@movies.each do |movie|
			if movie.title == movie_title
			 	users = get_user_from_comment(movie.comments)
			end
		end
		users
	end


	def get_user_from_comment(comments)
		users =[]
		comments.each do |comment_pair|
			users << comment_pair[0]
		end
		users
	end


end


 
require_relative '../lib/movies'


users = []



describe "tests for movies adding, deleting, etc." do 

	it "creates a new empty comment" do
		movie = Movie.new("Batman")
		expect(movie.add_comment("Paquito","")).to eq([["Paquito",""]])
	end

	it "creates a new comment with content" do
		movie = Movie.new("Batman")
		expect(movie.add_comment("Pedrito", "puta mierda")).to eq([["Pedrito","puta mierda"]])
	end

	it "adds more than one comment for a movie" do 
		movie = Movie.new("Batman")
		movie.add_comment("Pedrito", "puta mierda")
		movie.add_comment("Juanito", "a mi me ha molao")
		expect(movie.comments).to eq([["Pedrito", "puta mierda"], ["Juanito", "a mi me ha molao"]])
	end


end

describe "retrieve users: " do

	it "recovers users for a movie with no comments" do
		movies = Catalog.new
		movie = Movie.new("Armagedon")
		movies.add(movie)
		expect(movies.users_commented(movie.title)).to eq([])
	end

	it "recovers a single user which commented on a movie" do
		catalog = Catalog.new
		movie = Movie.new("Armagedon")
		catalog.add(movie)
		movie.add_comment("Perico","me ha molao")
		expect(catalog.users_commented("Armagedon")).to eq(["Perico"])
	end

	it "recovers a 2 users which commented on a movie" do
		catalog = Catalog.new
		movie = Movie.new("Armagedon")
		catalog.add(movie)
		movie.add_comment("Perico","me ha molao")
		movie.add_comment("Pablito", "no ha estado mal")
		expect(catalog.users_commented("Armagedon")).to eq(["Perico", "Pablito"])
	end

end

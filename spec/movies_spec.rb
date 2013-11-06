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

describe "test user information" do

	it "recovers users for a movie with no comments" do
		movie = Movie.new("Armagedon")
		expect(movie.users_comented(movie.title)).to eq([])
	end

end
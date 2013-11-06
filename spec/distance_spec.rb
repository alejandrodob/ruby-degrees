require_relative '../lib/movies'
describe "distance calculation: " do

    before :each do
        @armagedon = Movie.new("Armagedon")
        @batman = Movie.new("Batman")
        @movie_catalog = Catalog.new
        @movie_catalog.add(@armagedon)
        @movie_catalog.add(@batman)
        @peter = User.new("Peter")
        @mary = User.new("Mary")
        @paquito = User.new("Paquito")

        @batman.add_comment(@mary, "me ha molao")
        @batman.add_comment(@peter, "no ha estado mal")
        @armagedon.add_comment(@peter, "mola!")
        @armagedon.add_comment(@paquito, "pues a mi no")
    end

    it "should calculate distance of two users with only favorite movie Batman" do
        expect(@movie_catalog.distance("Perico", "Pablito")).to eq 0
    end



end
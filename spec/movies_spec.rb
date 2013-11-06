require_relative '../lib/movies'

describe "movies context" do

    before :each do
        @armagedon = Movie.new("Armagedon")
        @batman = Movie.new("Batman")
        @movie_catalog = Catalog.new
        @movie_catalog.add(@armagedon)
        @peter = User.new("Peter")
        @mary = User.new("Mary")
        @paquito = User.new("Paquito")
    end

    describe "tests for movies adding, deleting, etc." do 

        it "creates a new empty comment" do
            expect(@batman.add_comment(@paquito,"")).to eq([[@paquito,""]])
        end

        it "creates a new comment with content" do
            expect(@batman.add_comment(@mary, "pretty good")).to eq([[@mary,"pretty good"]])
        end

        it "adds more than one comment for a @batman" do 
            @batman.add_comment(@mary, "pretty good")
            @batman.add_comment(@peter, "a mi me ha molao")
            expect(@batman.comments).to eq([[@mary, "pretty good"], [@peter, "a mi me ha molao"]])
        end
    end

    describe "retrieve users: " do

        before :each do
            @movie_catalog.add(@batman)
        end

        it "recovers users for a movie with no comments" do
            expect(@movie_catalog.users_commented(@batman)).to eq([])
        end

        it "recovers a single user which commented on a movie" do
            @batman.add_comment(@peter,"me ha molao")
            expect(@movie_catalog.users_commented(@batman)).to eq [@peter]
        end

        it "recovers a 2 users which commented on a movie" do
            @batman.add_comment(@peter,"me ha molao")
            @batman.add_comment(@paquito, "no ha estado mal")
            expect(@movie_catalog.users_commented(@batman)).to eq([@peter, @paquito])
        end
    end

    describe "favorites: " do
        it "should list the favourite movies of a user" do
            @peter.add_favorite("Batman")
            expect(@peter.add_favorite("Armagedon")).to eq(["Batman", "Armagedon"])
        end
    end
end






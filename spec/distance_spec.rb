require_relative '../lib/movies'

describe "distance calculation: " do

    before :each do
        @armagedon = Movie.new("Armagedon")
        @batman = Movie.new("Batman")
        @thehobbit = Movie.new("The Hobbit")
        @dumbo = Movie.new("Dumbo")
        @movie_catalog = Catalog.new
        @movie_catalog.add(@armagedon)
        @movie_catalog.add(@batman)
        @movie_catalog.add(@thehobbit)
        @movie_catalog.add(@dumbo)
        @peter = User.new("Peter")
        @mary = User.new("Mary")
        @paquito = User.new("Paquito")
        @ferdinand = User.new("Ferdinand")
        @manoli = User.new("Manoli")
        @eustaquio = User.new("Eustaquio")

        @anne = User.new("Anne")

        @batman.add_comment(@mary, "me ha molao")
        @batman.add_comment(@peter, "no ha estado mal")
        @armagedon.add_comment(@peter, "mola!")
        @armagedon.add_comment(@paquito, "pues a mi no")
        @armagedon.add_comment(@manoli, "pues a mi no")
        @dumbo.add_comment(@manoli, "pues a mi no")
        @dumbo.add_comment(@eustaquio, "so cool!!")

        @thehobbit.add_comment(@ferdinand, "AWWWWWESOME")
    end

    it "should return true if a user commented a movie" do
        expect(@movie_catalog.user_commented?(@mary, @batman)).to eq true
    end

    it "should return false if a user did not comment a movie" do
        expect(@movie_catalog.user_commented?(@mary, @armagedon)).to eq false
    end

    it "should return empty for a user that did not comment any movies" do
        expect(@movie_catalog.movies_commented_by(@anne)).to eq([])
    end

    it "should return movies commented by a user that only commented one movie" do
        expect(@movie_catalog.movies_commented_by(@mary)).to eq([@batman])
    end

    it "should return an empty list for a user with no direct links" do
        expect(@movie_catalog.distance_zero_users(@ferdinand)).to eq []
    end

    it "should return paquito, manoli and mery as zero distance users for peter" do
        expect(@movie_catalog.distance_zero_users(@peter)).to eq [@paquito, @manoli, @mary]
    end

    it "should calculate distance of two users with only favorite movie Batman" do
        expect(@movie_catalog.distance(@mary, @peter)).to eq 0
    end

    it "should return 1 for two users with distance one" do
        expect(@movie_catalog.distance(@mary, @paquito)).to eq 1
    end

    it "should return 0 when calculating the distance of a user with himself" do
        expect(@movie_catalog.distance(@mary, @mary)).to eq 0
    end

    it "should return 'a lot' if 2 users have no links" do
        expect(@movie_catalog.distance(@mary, @ferdinand)).to eq 1000000000000
    end

    it "should return 2 for two users with distance 2, mary and eustaquio" do
        expect(@movie_catalog.distance(@mary, @eustaquio)).to eq 2
    end
end


describe "exhaust topology distance calculation: " do
    before(:each) do
        @armagedon = Movie.new("Armagedon")
        @thehobbit = Movie.new("The Hobbit")
        @dumbo = Movie.new("Dumbo")
        @superman = Movie.new("Superman")
        @spiderman = Movie.new("Spiderman")
        @gone = Movie.new("Gone with the wind")
        @batman2 = Movie.new("Batman")
        @batman3 = Movie.new("Batman")
        @batman4 = Movie.new("Batman")
        @batman5 = Movie.new("Batman")
        @batman = Movie.new("Batman")

        @movie_catalog = Catalog.new
        @movie_catalog.add(@batman)
        @movie_catalog.add(@batman2)
        @movie_catalog.add(@batman3)
        @movie_catalog.add(@batman4)
        @movie_catalog.add(@batman5)
        @movie_catalog.add(@thehobbit)
        @movie_catalog.add(@dumbo)
        @movie_catalog.add(@superman)
        @movie_catalog.add(@spiderman)
        @movie_catalog.add(@gone)
        @movie_catalog.add(@armagedon)


        @peter = User.new("Peter")
        @mary = User.new("Mary")
        @paquito = User.new("Paquito")
        @ferdinand = User.new("Ferdinand")

        @manoli = User.new("Manoli")
        @eustaquio = User.new("Eustaquio")
        @anne = User.new("Anne")
        @luis = User.new("Anne")
        @francis = User.new("Anne")
        @lorenzo = User.new("Anne")
        @juana = User.new("Anne")
        @rebeca = User.new("Anne")
        @carl = User.new("Anne")
        @harry = User.new("Anne")
        @michelle = User.new("Anne")

        @batman.add_comment(@peter, "me ha molao")
        @batman.add_comment(@mary, "me ha molao")
        @batman2.add_comment(@mary, "me ha molao")
        @batman2.add_comment(@paquito, "me ha molao")
        @batman3.add_comment(@paquito, "me ha molao")
        @batman3.add_comment(@ferdinand, "me ha molao")
        @batman4.add_comment(@ferdinand, "me ha molao")
        @batman4.add_comment(@peter, "me ha molao")
    end

    it "should return 1 for 2 users in opposite corners in a square topology" do
        expect(@movie_catalog.distance(@mary, @ferdinand)).to eq 1
    end

    it "should return 2 if we add the tail of the commet to the previous topology" do
        @batman5.add_comment(@peter, "terrific")
        @batman5.add_comment(@manoli, "terrific")
        expect(@movie_catalog.distance(@manoli, @paquito)).to eq 2
    end

    it "should return 'a lot' if 2 users are not connected and both isolated" do
        @batman5.add_comment(@manoli, "terrific")
        expect(@movie_catalog.distance(@manoli, @paquito)).to eq 1000000000000
    end

    it "should return 'a lot' if 2 users are not connected,
    but both of them have connections with other users" do
        @thehobbit.add_comment(@manoli, "me ha molao")
        @thehobbit.add_comment(@eustaquio, "me ha molao")
        @dumbo.add_comment(@anne, "me ha molao")
        @dumbo.add_comment(@lorenzo, "me ha molao")
        @superman.add_comment(@juana, "me ha molao")
        @superman.add_comment(@eustaquio, "me ha molao")
        @spiderman.add_comment(@luis, "me ha molao")
        @spiderman.add_comment(@rebeca, "me ha molao")
        @gone.add_comment(@lorenzo, "me ha molao")
        @gone.add_comment(@juana, "me ha molao")
        @armagedon.add_comment(@anne, "me ha molao")
        @armagedon.add_comment(@francis, "me ha molao")
        expect(@movie_catalog.distance(@manoli, @paquito)).to eq 1000000000000
    end
end

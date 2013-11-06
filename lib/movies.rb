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
        @users = []
    end

    def movies
        @movies
    end

    def users
        @users
    end

    def add(movie)
        @movies << movie
    end

    def add_user(user)
        @users << user
    end

    def users_commented(movie)
        users = []
        users = get_user_from_comment(movie.comments)
    end


    def get_user_from_comment(comments)
        users = []
        comments.each do |comment_pair|
            users << comment_pair[0]
        end
        users
    end

    def distance (user1, user2)
        if zero_distance_users(user1).include? (user2)
            0
        else
            -1
        end
    end

    def zero_distance_users(user)
        zer = []
        movies_commented_by(user).each do |movie|
            zer += users_commented(movie)
        end
        zer.uniq!
    end

    def movies_commented_by(user)
        mov_com = []
        movies.each do |movie|
            if movie.comments[0] == user
                mov_com << movie
            end
        end
        mov_com
    end

end


 class User
    def initialize(name)
        @name = name
        @favorites = []
    end

    def name
        @name
    end

    def favorites
        @favorites
    end

    def add_favorite(movie_title)
        @favorites << movie_title
    end

end
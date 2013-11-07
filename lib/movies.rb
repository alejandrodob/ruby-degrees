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
        get_users_from_comments(movie.comments)
    end

    def user_commented?(user, movie)
        users_commented(movie).include? user
    end

    def get_users_from_comments(comments)
        users = []
        comments.each do |comment_pair|
            users << comment_pair[0]
        end
        users
    end

    def distance(user1, user2, visited = [])
        if  distance_base_case?(user1, user2)
            0
        else
            distance_to_others = []
            distance_zero_users(user1).each do |next_user|
                if !visited.include? next_user
                    visited << next_user
                    visited_new = visited
                    distance_to_others << distance(user2, next_user, visited_new)
                end
            end
            distance_to_others.min + 1
        end
    end

    def distance_base_case?(user1, user2)
        distance_zero_users(user1).include?(user2) || 
        user1 == user2 || 
        distance_zero_users(user1).empty? || 
        distance_zero_users(user2).empty?
    end

    def distance_zero_users(user)
        zer = []
        movies_commented_by(user).each do |movie|
            zer += users_commented(movie)
        end
        zer.delete user
        zer.uniq
    end

    def movies_commented_by(user)
        mov_com = []
        movies.each do |movie|
            if  user_commented?(user, movie)
                mov_com << movie
            end
        end
        mov_com.uniq
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
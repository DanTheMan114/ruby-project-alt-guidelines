#require_relative "../bin/api_query.rb"

class CLI 

    def menu
        # Member.destroy_all
        # Movie.destroy_all
        # Review.destroy_all

        welcome
        options

        input = get_user_input
        if input == "login"
            login
        elsif input == "read my reviews"
            read_review
        elsif input == "write a review"
            write_review
        elsif input == "update review"
            update_review
        elsif input == "random review"
            random_review
        elsif input == "delete account"
            delete_account
        elsif input == "exit"
            brb
        else
            didnt_catch
            self.menu
    
        end
    
    end


    def get_user_input
        gets.chomp.downcase
    end
    

end

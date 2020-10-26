#require_relative "../bin/api_query.rb"

class CLI 

    def menu
        Member.destroy_all
        Movie.destroy_all
        Review.destroy_all

        welcome

        puts "~Please make a selection~"
    
        puts "1. Login"
        puts "2. Read my Review"
        puts "3. Write a Review"
        puts "4. Update Review"
        puts "5. Delete Account"
        puts "6. Exit"

        input = get_user_input
        if input == "login"
            login
        elsif input == "read my review"
            read_review
        elsif input == "write a review"
            write_review
        elsif input == "update review"
            update_review
        elsif input == "delete account"
            delete_account
        elsif input == "exit"
            puts "*********************"
            puts "Smh YOU WILL BE BACK!"
            puts "*********************"
        else
            puts "***********************"
            puts "Sorry didnt catch that."
            puts "***********************"
            self.menu
    
        end
    
    end




    def get_user_input
        gets.chomp.downcase
    end
    


end

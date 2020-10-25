class CLI

    def menu
        puts "*************************"
        puts "Welcome to Spoiled Tomato"
        puts "*************************"

        puts "~Please make a selection~"
    
        puts "1. Login"
        puts "2. Read my Review"
        puts "3. Write a Review"
        puts "4. Update Review"
        puts "5. Delete Account"
        puts "6. Exit"
    
    
        if get_user_input == "login"
            login
        elsif get_user_input == "read my review"
            read_review
        elsif get_user_input == "write a review"
            write_review
        elsif get_user_input == "update review"
            update_review
        elsif get_user_input == "delete account"
            delete_account
        elsif get_user_input == "exit"
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

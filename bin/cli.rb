#require_relative "../bin/api_query.rb"

class CLI 

    def menu
        Member.destroy_all
        Movie.destroy_all
        Review.destroy_all

        #welcome

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


    def menu2
        puts "~Please make a selection~"
        puts "1. Read my Review"
        puts "2. Write a Review"
        puts "3. Update Review"
        puts "4. Delete Account"
        puts "5. Exit"
        input = get_user_input
        if input == "read my review"
            read_my_review2
        elsif input == "write a review"
            write_review2
        elsif input == "update review"
            update_review2
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
            menu2
    
        end
    
    end
    

    def login
        puts "**********************************************"
        puts "Enter your name you used to make your account!"
        puts "**********************************************"
        member = gets.chomp
        if Member.find_by(name: member)
            @member = Member.find_or_create_by(name: member)
            puts "*********************"
            puts "Welcome Back, #{member}! \n"
            puts "====================="
            puts "Make a new slection!"
            puts "===================="
            menu2
        else
            puts "?????-----------------------------------------------------------------"
            puts "#{member} WHO ARE YOU?? Just kidding no worries we logged you in enjoy!"
            puts "----------------------------------------------------------------------"
            @member = Member.find_or_create_by(name: member)
            menu2
        end
    end

    

    def get_user_input
        gets.chomp.downcase
    end

    

end

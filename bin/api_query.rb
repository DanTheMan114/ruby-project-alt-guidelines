require 'rest-client'
require 'json'
require 'pry'




def welcome 
    puts "*************************"
    puts "Welcome to Spoiled Tomato"
    puts "*************************"
end

def menu2

    puts "~Please make a selection~"

    puts "1. Read my Review"
    puts "2. Write a Review"
    puts "3. Update Review"
    puts "4. Delete Account"
    puts "5. Exit"

    user_input = gets.chomp

    if user_input.downcase == "read my review"
        read_my_review2
    elsif user_input.downcase == "write a review"
        write_review2
    elsif user_input.downcase == "update review"
        update_review2
    elsif user_input.downcase == "delete account"
        delete_account
    elsif user_input.downcase == "exit"
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



def menu
    puts "~Please make a selection~"

    puts "1. Login"
    puts "2. Read my Review"
    puts "3. Write a Review"
    puts "4. Update Review"
    puts "5. Delete Account"
    puts "6. Exit"

    user_input = gets.chomp

    if user_input.downcase == "login"
        login
    elsif user_input.downcase == "read my review"
        read_review
    elsif user_input.downcase == "write a review"
        write_review
    elsif user_input.downcase == "update review"
        update_review
    elsif user_input.downcase == "delete account"
        delete_account
    elsif user_input.downcase == "exit"
        puts "*********************"
        puts "Smh YOU WILL BE BACK!"
        puts "*********************"
    else
        puts "***********************"
        puts "Sorry didnt catch that."
        puts "***********************"
        menu

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





    def delete_account
        puts"**************************************"
        puts"Enter your name so we can delete it!!"
        puts"**************************************"
        input = gets.chomp
        member = Member.find_by(name: input)
        member.destroy
        puts "Your name and Reviews were never here oops."
        menu
    end

    

    def write_review
        puts "**********************************************"
        puts "Enter your name you used to make your account!"
        puts "**********************************************"
        name = gets.chomp
        if Member.find_by(name: name)
            @member = Member.find_or_create_by(name: name)
            puts "*********************"
            puts "Welcome Back, #{name}! \n"
            puts "====================="
            puts "Make a new slection!"
            puts "===================="
            
        end

    end

    def write_review2
        if @member
            puts "------------------------------------------------------------"
            puts "Now that your under your account whats the name of the movie?"
            puts "------------------------------------------------------------"
            movie_name = gets.chomp
            puts "-----------------------------------------------------------------------"
            puts "Okay tell Spoiled Tomato fans how you feel about #{movie_name}."
            puts "-----------------------------------------------------------------------"
            member_comments = gets.chomp
            puts "----------------------------------------"
            puts "What would you rate this movie out of 5?"
            puts "----------------------------------------"
            member_rating = gets.chomp
            i = Movie.find_or_create_by(title: movie_name)
            Review.create(member_id: @member.id, movie_id: i.id, rating: member_rating, comments: member_comments)
            puts "-----------------------------------------------------------------"
            puts "Congrats you made a review about #{movie_name} on Spoiled Tomato"
            puts "-----------------------------------------------------------------"
            menu2
        end
    end



    def read_review # make a randome review pop up
        puts "**********************************************"
        puts "Enter your name you used to make your account!"
        puts "**********************************************"
        name = gets.chomp
        if Member.find_by(name: name)
            @member = Member.find_or_create_by(name: name)
            puts "*********************"
            puts "Welcome Back, #{name}! \n"
            puts "====================="
            puts "Make a new slection!"
            puts "===================="
            menu2
        end
         
    end

    def read_my_review2(member)
        real_reviews
    end

            
        # else
        #     puts ""
        #     puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        #     puts "Sorry, there is no user with that name, try again?"
        #     puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        #     puts ""
        # end

        def real_reviews

        end




    # def real_reviews
    #     member = gets.chomp
    #     member.reviews.select{|review| review|
    #     puts "member_id #{review.member_id}"
    #     puts "movie_id #{review.movie_id}"
    #     puts "rating #{review.rating}"
    #     puts "comments #{review.comments}"
    #     puts"***********************"
    # }
    # end
#(member_id: daniel.id, movie_id: titanic.id, rating: 4, comments:"Best one out!!" )


    def update_review # make a randome review pop up
        puts "**********************************************"
        puts "Enter your name you used to make your account!"
        puts "**********************************************"
        name = gets.chomp
        if Member.find_by(name: name)
            @member = Member.find_or_create_by(name: name)
            puts "*********************"
            puts "Welcome Back, #{name}! \n"
            puts "====================="
            puts "Make a new slection!"
            puts "===================="
            menu2
        end
         
    end

    def update_review2
        puts "+++++++++++++++++++++++++++++++++++++++"
        puts "Enter the Movie you made a review about"
        puts "+++++++++++++++++++++++++++++++++++++++"
        movie_name = gets.chomp
        i = Movie.find_or_create_by(title: movie_name)
        review = Review.find_by(movie_id: i.id)
        if review
            puts "++++++++++++++++++++++++++++++++++++++++++++" 
            puts "Okay what new would you like to say about it?"
            puts "++++++++++++++++++++++++++++++++++++++++++++"
            
            new_movie_comments = gets.chomp
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
            puts "Okay whats your new rating out of 5 for the movie?"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++"
            new_rating = gets.chomp
            review.update(comments: new_movie_comments)
            review.update(rating: new_rating)
            puts "+++++++++++++++++++++++++++++++++++"
            puts "All set your review has been posted"
            puts "++++++++++++++++++++++++++++++++++++"
            menu2
        else
            puts "**********************"
            puts "Sorry incorrect enrty!"
            puts "**********************"
            update_review2
        end
    end

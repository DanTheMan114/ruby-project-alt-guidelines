require 'rest-client'
require 'json'
require 'pry'


def menu
    options

    user_input = gets.chomp

    if user_input.downcase == "login"
        login
    elsif user_input.downcase == "read my review"
        read_review
    elsif user_input.downcase == "write a review"
        write_review
    elsif user_input.downcase == "update review"
        update_review
    elsif user_input.downcase == "random review"
        random_review
    elsif user_input.downcase == "delete account"
        delete_account
    elsif user_input.downcase == "exit"
        brb
    else
        didnt_catch
        menu
    end
end


def menu2

    puts "~Please make a selection~"

    puts "1. Read my Review"
    puts "2. Write a Review"
    puts "3. Update Review"
    puts "4. Random Review"
    puts "5. Delete Account"
    puts "6. Exit"

    user_input = gets.chomp

    if user_input.downcase == "read my review"
        read_my_review2
    elsif user_input.downcase == "write a review"
        write_review2
    elsif user_input.downcase == "update review"
        update_review2
    elsif user_input.downcase == "random review"
        random_review
    elsif user_input.downcase == "delete account"
        delete_account
    elsif user_input.downcase == "exit"
        brb
    else
        didnt_catch
        menu2
    end
end


def login
    enter_sign
    member = gets.chomp
    if Member.find_by(name: member)
        @member = Member.find_or_create_by(name: member)
        puts "*********************"
        puts "Welcome Back, #{member}! \n"
        selection
        menu2
    else
        puts "?????-----------------------------------------------------------------"
        puts "#{member} WHO ARE YOU?? Just kidding no worries we logged you in enjoy!"
        puts "----------------------------------------------------------------------"
        @member = Member.create(name: member)
        menu2
    end
end


def delete_account
    enter_sign
    input = gets.chomp
    if 
        member = Member.find_by(name: input)
        member.destroy
        puts "#{input} and its Reviews were deleted!"
    else
        puts '<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>'
        puts "Sorry '#{input}' is not in our date base. Try again or create a new account."
        puts '<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>'
    end
    menu
end



def write_review
    enter_sign
    name = gets.chomp
    if Member.find_by(name: name)
        @member = Member.find_or_create_by(name: name)
        puts "*********************"
        puts "Welcome Back, #{name}! \n"
        selection
    else 
        puts "Cant seem so fine that name in our date base, try again or login!"
        menu
        
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
    enter_sign
    name = gets.chomp
    if Member.find_by(name: name)
        @member = Member.find_by(name: name)
        puts "*********************"
        puts "Welcome Back, #{name}! \n"
        selection
        menu2
    else 
        puts "Sorry, was not able to to find #{name} in date base, try again or login in with the correct name."
        menu
    end
     
end



def read_my_review2

end

def random_review
    puts "[][][][][][][][][][][][][][][]"
    rand_one = Review.all.each{|review|review}.sample
    rand_two = Movie.all.each{|mov|mov.title}.sample
    rand_three = Member.all.each{|mem|mem.name}.sample
    puts "Member: #{rand_three.name}"
    puts "Movie: #{rand_two.title}"
    puts "Rating: #{rand_one.rating}"
    puts "Comments: '#{rand_one.comments}'"
    puts "[][][][][][][][][][][][][][][]"
end




def update_review 
    log_again
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
        puts "****************************************************"
        puts "Sorry you dont have any reviews for #{movie_name}!"
        puts "****************************************************"
        update_review2
    end
end



def log_again
    enter_sign
    name = gets.chomp
    if Member.find_by(name: name)
        @member = Member.find_or_create_by(name: name)
        puts "*********************"
        puts "Welcome Back, #{name}! \n"
        selection
        menu2
    end
end

def welcome 
    puts "**************************"
    puts "Welcome to Spoiled Tomato!"
    puts "**************************"
end

def enter_sign
    puts "**********************************************"
    puts "Enter your name you used to make your account!"
    puts "**********************************************"
end

def name
    gets.chomp.downcase
end

def selection
    puts "====================="
    puts "Make a new slection!"
    puts "===================="
end

def brb
    puts "*********************"
    puts "Smh YOU WILL BE BACK!"
    puts "*********************"
end

def didnt_catch
    puts "***********************"
    puts "Sorry didnt catch that."
    puts "***********************"
end

def options
    puts "~Please make a selection~"
    puts "1. Login"
    puts "2. Read my Reviews"
    puts "3. Write a Review"
    puts "4. Update Review"
    puts "5. Random Review"
    puts "6. Delete Account"
    puts "7. Exit"
end





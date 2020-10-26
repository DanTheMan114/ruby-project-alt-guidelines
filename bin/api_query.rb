require 'rest-client'
require 'json'
require 'pry'


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
        read_my_review2(member)
    else
        puts "?????-----------------------------------------------------------------"
        puts "#{member} WHO ARE YOU?? Just kidding no worries we logged you in enjoy!"
        puts "----------------------------------------------------------------------"
        @member = Member.find_or_create_by(name: member)
        menu
    end
end

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

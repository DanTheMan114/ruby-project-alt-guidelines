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

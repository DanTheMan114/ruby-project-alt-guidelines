require_relative "../lib/models/member.rb"
require_relative "../lib/models/movie.rb"
require_relative "../lib/models/review.rb"
require_relative "../config/environment.rb"


# Member.destroy_all
# Review.destroy_all
# Movie.destroy_all


daniel = Member.create(name: "Daniel")
tyana = Member.create(name: "Tyana")
ary = Member.create(name: "Ary")
sheena = Member.create(name: "Sheena")
yoshi = Member.create(name: "Yoshi")


avengers_endgame = Movie.create(title: "Avengers Endgame", genre: "Action", year: 2019)
avatar = Movie.create(title: "Avatar", genre: "Sci-fi", year: 2019)
titanic = Movie.create(title: "Titanic", genre: "Romance", year: 1997)
star_wars_the_force_awakens = Movie.create(title: "Star Wars The Force Awakens", genre: "Science fiction", year: 2015)
avengers_infinity_war = Movie.create(title: "Avengers Infinity War", genre: "Action", year: 2018)

daniel_review = Review.create(member_id: daniel.id, movie_id: star_wars_the_force_awakens.id, rating: 5, comments:"Must watch/see!!" )
daniel_review = Review.create(member_id: daniel.id, movie_id: avatar.id, rating: 5, comments:"I thought i was cool" )
daniel_review = Review.create(member_id: daniel.id, movie_id: titanic.id, rating: 4, comments:"Best one out!!" )
tyana_review = Review.create(member_id: tyana.id, movie_id: avengers_endgame.id, rating: 5, comments:"I love marvel.")
ary_review = Review.create(member_id: ary.id, movie_id: avatar.id, rating: 3, comments:"Its okay or whatever.")
yoshi_review = Review.create(member_id: yoshi.id, movie_id: avengers_infinity_war.id, rating: 1, comments:"I went to sleep sorry!")
sheena_review = Review.create(member_id: sheena.id, movie_id: star_wars_the_force_awakens.id, rating: 5, comments:"It was a great movie")

p [daniel_review, tyana_review, sheena_review, yoshi_review, ary_review]





class Movie < ActiveRecord::Base
    has_many :reviews
    has_many :members, through: :reviews
end

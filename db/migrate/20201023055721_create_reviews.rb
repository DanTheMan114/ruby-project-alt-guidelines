class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comments
      t.integer :member_id
      t.integer :movie_id
      t.index ["member_id"], name: "index_reviews_on_member_id"
      t.index ["movie_id"], name: "index_reviews_on_movie_id"

      t.timestamps
    end

  end
end

class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :runtime
      t.string :genere
      t.string :director
      t.string :writer
      t.string :actor
      t.text :plot
      t.string :poster
      t.string :imdb_id
      t.string :imdb_rating

      t.timestamps
    end
  end
end

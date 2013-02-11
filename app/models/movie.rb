class Movie < ActiveRecord::Base
  attr_accessible :actor, :director, :genere, :imdb_id, :imdb_rating, :plot, :poster, :rated, :runtime, :title, :writer, :year

  validates :title, presence: true
  validates :imdb_id, uniqueness: true

  def self.new_from_omdb data
    att = {
      actor: data["Actor"],
      director: data["Director"],
      genere: data["Genere"],
      imdb_id: data["imdbID"],
      imdb_rating: data["imdbRating"],
      plot: data["Plot"],
      poster: data["Poster"],
      rated: data["Rated"],
      runtime: data["Runtime"],
      title: data["Title"],
      writer: data["Writer"],
      year: data["Year"]
    }

    movie = new(att)
    movie.save
    movie
  end
end

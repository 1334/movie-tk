require 'omdb/client'

class MoviesController < ApplicationController
  http_basic_authenticate_with :name => ENV['HTTP_USER'], :password => ENV['HTTP_PASS']

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Omdb::Client.search_by_imdb_id params["movie"]["imdb_id"]
    if movie.is_a? Omdb::MovieNotFound
      @movie = Movie.new imdb_id: params["movie"]["imdb_id"]
      @movie.errors.add(:imdb_id, "movie id not found")
      render action: "new"
    else
      Movie.new_from_omdb movie
      redirect_to movies_path, alert: "Movie added successfully"
    end
  end
end

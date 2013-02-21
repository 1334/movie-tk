require 'open-uri'
require 'json'

module Omdb
  class Client
    def self.search_by_imdb_id id
      new.search_by_imdb_id id
    end

    def search_by_imdb_id id
      response = JSON.parse get(id)
      response["Response"] == "False" ? MovieNotFound.new : response
    end

    private

    def get query
      open("http://www.omdbapi.com/?i=#{URI::encode query}").read
    end
  end

  MovieNotFound = Class.new
end

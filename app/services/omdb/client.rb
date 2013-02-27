require 'open-uri'
require 'json'

module Omdb
  class Client
    def self.search_by_imdb_id id
      new.search_by_imdb_id id
    end

    def self.serach_by_title title
      new.serach_by_title title
    end

    def search_by_imdb_id id
      response = search "i=#{id}"
      response["Response"] == "False" ? MovieNotFound.new : response
    end

    def serach_by_title title
      # omdbapi returns a Hash  with 'Search' => results_array 
      # by omdbapi design it returns a maximum of 10 results
      response = search "s=#{title}"
      response["Response"] == "False" ? MovieNotFound.new : response['Search']
    end

    private

    def search query
      response = JSON.parse get(query)
    end

    def get query
      open("http://www.omdbapi.com/?#{URI::encode query}").read
    end
  end

  MovieNotFound = Class.new
end

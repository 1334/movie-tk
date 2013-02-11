class MoviesController < ApplicationController
  http_basic_authenticate_with :name => ENV['HTTP_USER'], :password => ENV['HTTP_PASS']

  def index
  end
end

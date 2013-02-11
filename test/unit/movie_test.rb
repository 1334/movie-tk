require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'default facory is vaild' do
    assert FactoryGirl.build(:movie).valid?, 'default factory is invalid'
  end

  test 'is invalid without a title' do
    movie = Movie.new
    refute movie.valid?, 'is invalid without a title'
  end

  test 'imdb_id must be unique' do
    movie1 = FactoryGirl.create(:movie)
    movie2 = FactoryGirl.create(:movie)
    movie2.imdb_id = movie1.imdb_id
    movie2.save
    assert_includes movie2.errors, :imdb_id
  end

  describe '#new_from_omdb' do
    it 'creates a new user from omdbapi.com json response' do
      attr = JSON.parse open('test/assets/ghost_writer.json').read
      movie = Movie.new_from_omdb attr
      assert movie.valid?
      assert_instance_of Movie, movie
    end

    it 'returns an empty object if attr are empty' do
      attr = {}
      movie = Movie.new_from_omdb attr
      refute movie.valid?
    end
  end
end

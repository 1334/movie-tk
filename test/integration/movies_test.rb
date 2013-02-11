require 'test_helper'

class MoviesTest < ActionDispatch::IntegrationTest
  test "list no movies" do
    Movie.delete_all

    visit_and_authenticate movies_path

    assert page.has_content?('There are no movies'), "Message 'There are no movies' not found on page"
  end

  test "can add a movie from imdb_id" do
    visit_and_authenticate new_movie_path
    fill_in :movie_imdb_id, with: "tt1139328"
    click_on "Create"

    assert_equal movies_path, current_path
    assert page.has_content?('The Ghost Writer'), "Page doesn't have text 'The Ghost Writer'"
  end
end

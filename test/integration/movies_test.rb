require 'test_helper'

class MoviesTest < ActionDispatch::IntegrationTest
  test "list no movies" do
    visit_and_authenticate movies_path

    assert page.has_content?('There are no movies'), "Message 'There are no movies' not found on page"
  end
end

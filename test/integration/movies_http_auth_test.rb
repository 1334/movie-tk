require 'test_helper'

class MoviesHttpAuthTest < ActionDispatch::IntegrationTest
  test "should block access with no HTTP auth credentials" do
    visit movies_path
    assert_equal 401, page.status_code
  end

  test "should block access with invalid HTTP auth credentials" do
    basic_auth('wronguser', 'testpass')
    visit movies_path
    assert_equal 401, page.status_code

    basic_auth('testuser', 'wrongpass')
    visit movies_path
    assert_equal 401, page.status_code
  end

  test "should allow the page with valid HTTP auth credentials" do
    basic_auth('testuser', 'testpass')
    visit movies_path
    assert_equal 200, page.status_code
  end
end

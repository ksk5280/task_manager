require_relative '../test_helper'

class HomePageGreetingTest < Minitest::Test
  include Capybara::DSL

  def test_home_page_welcomes_user
    # as any type of user
    # when I visit the home page
    visit '/'
    # then I see "Welcome to the TaskManager!"

    # save_and_open_page

    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager!")
    end
  end
end

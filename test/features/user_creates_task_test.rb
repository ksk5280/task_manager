require_relative '../test_helper'

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes

    # As a user
    # When I visit the home page
    visit '/'
    # And I click on "New Task"
    click_link("New Task")
    # And I fill in the title
    fill_in("task[title]", with: "This is a new task")
    # And I fill in the description
    fill_in("task[description]", with: "This is a description!")
    # And I click Submit
    click_button('submit')
    assert_equal "/tasks", current_path

    # Then I should see my task
    within("#tasks") do
      assert page.has_content?("This is a new task")
    end
  end
end

require_relative '../test_helper'

class UserDeletesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_changes_title_and_description
    data1 = {
      title:       "some title",
      description: "some description"
    }
    task_manager.create(data1)
    data2 = {
      title:       "another title",
      description: "another description"
    }
    task_manager.create(data2)
    # As a user
    # When I visit the home page
    visit '/'
    # And I click on the task index
    click_link("Task Index")
    assert '/tasks', current_path
    # And I click on the delete button
    first(:button, "Delete").click
    # Then I should no longer see the task in the task index
    assert '/tasks', current_path
    within("#tasks") do
      refute page.has_content?("some title")
      assert page.has_content?("another title")
    end
  end
end

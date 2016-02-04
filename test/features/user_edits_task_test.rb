require_relative '../test_helper'

class UserEditsTaskTest < Minitest::Test
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
    # And I click on the edit button
    first(:link, "Edit").click
    assert '/tasks/:id/edit', current_path
    # And I change the title
    fill_in("task[title]", with: "Different title")
    # And I change the description
    fill_in("task[description]", with: "Different description")
    # And I click submit
    click_button('submit')
    # Then I should see the task index with the edited task
    assert '/tasks', current_path
    within("#tasks") do
      assert page.has_content?("Different title")
    end
  end
end

require 'test_helper'

class TaskActionsTest < ActionDispatch::IntegrationTest
  def test_user_can_create_list
    create(:list)
    visit root_path

    click_link "Create New Task"

    fill_in "task[title]", with: "New Task"
    fill_in "task[description]", with: "New Description"
    save_and_open_page

    fill_in "task[due_date]", with: "2015-06-22"
    click_button "Submit This Damn Task"
    save_and_open_page

    assert_equal root_path, current_path
    assert page.has_content?("New Task")
    assert page.has_selector?(".task", count:1)
  end
end

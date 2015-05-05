require 'test_helper'

class TaskActionsTest < ActionDispatch::IntegrationTest
  def test_user_can_create_task
    list = create(:list)
    visit root_path

    click_link "Create New Task"

    fill_in "task[title]", with: "New Task"
    fill_in "task[description]", with: "New Description"

    fill_in "task[due_date]", with: "2015-06-22"
    click_button "Submit This Damn Task"

    assert_equal root_path, current_path
    assert page.has_content?("New Task")
    assert list.tasks.count == 1
    assert page.has_selector?(".task", count:1)
  end

  def test_user_can_update_task
    list = create(:list)
    list.tasks << create_list(:task, 2)
    visit root_path

    assert page.has_selector?("li", count:2)

    first(".task").click_link "Update Task"

    fill_in "task[title]", with: "New Task"
    fill_in "task[description]", with: "New Description"
    fill_in "task[due_date]", with: "2015-06-22"

    click_button "Update this Task"

    assert_equal root_path, current_path
    within first(".task") do
      assert page.has_content?("New task")
    end
    assert list.tasks.count == 2
    assert page.has_selector?(".task", count:2)
  end
end

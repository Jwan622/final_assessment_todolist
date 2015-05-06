require 'test_helper'

class ListActionsTest < ActionDispatch::IntegrationTest
  def test_user_can_create_list
    visit root_path

    click_link "Create New List"
    fill_in "list[title]", with: "New List"
    click_button "Submit This Damn List"

    assert_equal root_path, current_path
    assert page.has_content?("New List")
    assert page.has_selector?(".lists", count:1)
  end

  def test_user_can_rename_a_list
    create(:list, title: "Old Name")
    visit root_path

    click_link "Edit Title"

    fill_in "list[title]", with: "New Title Name"
    click_button "Change Title"

    assert_equal root_path, current_path
    assert page.has_content?("New Title Name")
    assert page.has_content?("List updated")
    refute page.has_content?("Old Name")
  end


  def test_user_can_archive_list
    create(:list, title: "Old Name")
    visit root_path
    save_and_open_page
    
    click_link "Archive List"

    assert_equal root_path, current_path
    within(".lists") do
      refute page.has_content?("Old Name")
    end
    assert page.has_content?("List Archived")
  end

  def test_user_can_delete_archived_list
    create(:list, status: "archived", title: "Some List")

    visit root_path
    click_link "View Archived Lists"
    click_link "Delete List"

    assert List.count == 0
    within(".lists") do
      refute page.has_content?("Some List")
    end
    assert page.has_content?("List Destroyed")
  end
end

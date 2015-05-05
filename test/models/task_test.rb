require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_uniqueness_of(:title).
    with_message('Please choose another title')
  should validate_presence_of(:status)
  # this validates_presence_of(:status) must be building an task behind the scenes without a status
  should validate_presence_of(:description)
  should validate_presence_of(:due_date)
  should belong_to(:list)

  def test_it_has_a_default_status
    task = build(:task)
    assert_equal "incomplete", task.status
  end
end

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_uniqueness_of(:title).
    with_message('Please choose another title')
  should have_many(:tasks)

  def test_it_has_a_default_status
    list = build(:list)
    assert_equal "unarchived", list.status
  end
end

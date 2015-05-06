require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  def test_it_should_be_valid_with_a_jpg_file
    photo = create(:photo)

    assert photo.valid?
    assert_equal photo.avatar.class, Paperclip::Attachment
    assert_match /public\/assets\/avatars\/todo/, photo.avatar.url
  end

  def test_it_should_be_invalid_with_a_yml_file
    photo = build(:photo, avatar: File.new(Rails.root.join('test', 'fixtures', 'lists.yml')))

    assert photo.invalid?
    assert_equal photo.errors.messages[:avatar][0], "Only image files are allowed."
  end
end

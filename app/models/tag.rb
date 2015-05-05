class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :tasks, through: :taggings

  validates :tag_name, presence: true, uniqueness: { message: "This tag name already exists" }
end

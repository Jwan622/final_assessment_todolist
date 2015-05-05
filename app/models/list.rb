class List < ActiveRecord::Base
  has_many :tasks
  validates :title, presence: true, uniqueness: {message: "Please choose another title" }
end

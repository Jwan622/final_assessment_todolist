class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true, uniqueness: {message: "Please choose another title"}
  validates :status, presence: true
  validates :due_date, presence: true
  validates :description, presence: true
end

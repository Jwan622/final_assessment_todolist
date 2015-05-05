FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "Task Title#{n}" }
    description "Prank Steve and the rest of the instructors for the assessment."
    due_date Date.new(2015,6,22)
  end
end

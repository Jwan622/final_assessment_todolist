FactoryGirl.define do
  factory :photo do
    avatar File.new(Rails.root.join('test', 'fixtures', 'todo.jpg'))
  end
end

unarchived_list1 = List.create(title: "Unarchived List1", status:"unarchived")
unarchived_list2 = List.create(title: "Unarchived List2", status:"unarchived")
unarchived_list3 = List.create(title: "Unarchived List3", status: "unarchived")
archived_list1 = List.create(title: "Archived List1", status: "archived")

task1 = Task.create(title: "This Task has many taggings1", due_date: Date.new(2015, 7, 22), status: "complete", description: "Oh god taggings")
task2 = Task.create(title: "This Task has many taggings2", due_date: Date.new(2015, 7, 22), status: "complete", description: "Oh god taggings")
task3 = Task.create(title: "This Task has many taggings3", due_date: Date.new(2015, 7, 22), status: "complete", description: "Oh god taggings")
task4 = Task.create(title: "This Task has many taggings4", due_date: Date.new(2015, 7, 22), status: "complete", description: "Oh god taggings")

tag12 = Tag.create(tag_name: "Belongs to task 1 and 2")
tag23 = Tag.create(tag_name: "Belongs to task 2 and 3")
tag123 = Tag.create(tag_name: "Belongs to task 1 and 2 and 3")
tag4 = Tag.create(tag_name: "Belongs to task 4")

task1.tags << tag12
task1.tags << tag12
task1.tags << tag12
task2.tags << tag12
task2.tags << tag23
task2.tags << tag123
task2.tags << tag23
task3.tags << tag123
task3.tags << tag23
task4.tags << tag4

unarchived_list3.tasks << task1
unarchived_list3.tasks << task2
unarchived_list3.tasks << task3
unarchived_list3.tasks << task4

unarchived_list1.tasks << Task.create(title: "Some Task0", due_date: Date.new(2015,6,22), description: "Finish this assessment.")
unarchived_list1.tasks << Task.create(title: "Some Task1", due_date: Date.new(2015,6,23), description: "Prank Steve.")
unarchived_list1.tasks << Task.create(title: "Some Task2", due_date: Date.new(2015,6,24), description: "Celebrate newfound freedom.")
unarchived_list1.tasks << Task.create(title: "Some Task3", due_date: Date.new(2015,7,22), description: "Live life.")
unarchived_list1.tasks << Task.create(title: "Some Task4", due_date: Date.new(2015,7,22), description: "Live lifes.")
unarchived_list1.tasks << Task.create(title: "Some Task5", due_date: Date.new(2015,7,22), description: "Live lifez.")
unarchived_list1.tasks << Task.create(title: "Some Task6", due_date: Date.new(2015,7,22), status: "complete", description: "Live life.")
unarchived_list1.tasks << Task.create(title: "Some Task7", due_date: Date.new(2015,7,22), status: "complete", description: "Live life.")

archived_list1.tasks << Task.create(title: "Some Task 8", due_date: Date.new(2015, 8, 22), description: "Turing is done!")

unarchived_list2.tasks << Task.create(title: "Some Task9", due_date: Date.new(2015,6,25), description: "Prank Steve continuously.")

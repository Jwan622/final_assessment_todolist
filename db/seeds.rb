# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unarchived_list1 = List.create(title: "Unarchived List1", status:"unarchived")
unarchived_list2 = List.create(title: "Unarchived List2", status:"unarchived")

unarchived_list1.tasks << Task.create(title: "Some Task0", due_date: Date.new(2015,6,22), description: "Finish this assessment.")
unarchived_list1.tasks << Task.create(title: "Some Task1", due_date: Date.new(2015,6,23), description: "Prank Steve.")
unarchived_list1.tasks << Task.create(title: "Some Task2", due_date: Date.new(2015,6,24), description: "Celebrate newfound freedom.")
unarchived_list1.tasks << Task.create(title: "Some Task3", due_date: Date.new(2015,7,22), description: "Live life.")

unarchived_list2.tasks << Task.create(title: "Some Task4", due_date: Date.new(2015,6,25), description: "Prank Steve continuously.")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [User.create(username: "jared", email: "jared@jared.com", password: "Password1"),User.create(username: "katbroner", email: "katbroner@jared.com", password: "Password1"),User.create(username: "samanthavholmes", email: "samanthavholmes@jared.com", password: "Password1"),User.create(username: "efitz", email: "efitz@jared.com", password: "Password1"),User.create(username: "user1234", email: "user1234@gmail.com", password: "Password1"),User.create(username: "usernameusername", email: "auser@gmail.com", password: "Password1"),User.create(username: "jared2", email: "jared2@gmail.com", password: "Password1")]

20.times do
	Project.create(title: Faker::Hipster.sentence, user: users.sample, summary: Faker::Hipster.paragraph([3..9].sample, true))
end

60.times do
	Character.create(project: Project.all.sample, name: Faker::Name.name, description: Faker::Hipster.sentence)
end

30.times do
	Chapter.create(project: Project.all.sample, chapter_number: rand(1..63), chapter_title: Faker::Hipster.sentence, summary: Faker::Hipster.paragraph([2..8].sample, true))
end

100.times do
	PlotPoint.create(main_plot: [true, false].sample, project: Project.all.sample, description: Faker::Hipster.paragraph([2..8].sample, true))
end

100.times do
	Project.all.sample.chapters << Chapter.all.sample

	Project.all.sample.characters << Character.all.sample

	Project.all.sample.plot_points << PlotPoint.all.sample

	Chapter.all.sample.plot_points << PlotPoint.all.sample

	Character.all.sample.chapters << Chapter.all.sample
end
# Chapter.all.sample.charaters << Character.all.sample

good_user = User.create(username: "jsgordon212", email: "jsgordon@jared.com", password: "Password1")

good_user_projects = []

4.times do
	good_user_projects << Project.create(title: Faker::Hipster.sentence, user: good_user, summary: Faker::Hipster.paragraph([3..9].sample, true))
end 

16.times do
	Character.create(project: good_user_projects.sample, name: Faker::Name.name, description: Faker::Hipster.sentence)
end

30.times do
	Chapter.create(project: good_user_projects.sample, chapter_number: rand(1..17), chapter_title: Faker::Hipster.sentence, summary: Faker::Hipster.paragraph([2..8].sample, true))
end

47.times do
	PlotPoint.create(main_plot: [true, false].sample, project: good_user_projects.sample, description: Faker::Hipster.paragraph([2..8].sample, true))
end


good_user = User.create(username: "jsgordon212", email: "jsgordon@jared.com", password: "Password1")

Project.create(title: "The Lost Boy", user: good_user, summary: "A story of a boy who is looking for meaning in life.")

Project.create(title: "The Adventures of Peter Humming", user: good_user, summary: "A businessman tries something new every day.")

Project.create(title: "Finding Sally", user: good_user, summary: "A man sees his one true love on a subway and seeks out to find her.")

Project.create(title: "It's Nice to See You Again", user: good_user, summary: "Twins separated at birth randomly run into each other in New York City 25 years later.")

Character.create(project: Project.find_by(title: "It's Nice to See You Again"), name: "Todd Walters", description: "Twin #1, Artist")

Character.create(project: Project.find_by(title: "It's Nice to See You Again"), name: "Brian Walters", description: "Twin #2, Musician")

Character.create(project: Project.find_by(title: "It's Nice to See You Again"), name: "Marie Parker", description: "Brian's girlfriend")

Character.create(project: Project.find_by(title: "It's Nice to See You Again"), name: "Frank Hill", description: "Todd's best friend")


PlotPoint.create(main_plot: false, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd decides to go play football with his bestfriend, Frank, in Central Park.")

PlotPoint.create(main_plot: false, project: Project.find_by(title: "It's Nice to See You Again"), description: "Brian and his girlfriend, Marie, have a picnic in Central Park.")

PlotPoint.create(main_plot: true, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd's football lands on Brian's blanket.")

PlotPoint.create(main_plot: true, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd and Brian meet for the first time when Brian passes Todd his football back.")

PlotPoint.create(main_plot: false, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd and Brian get drinks at Ulysses.")

PlotPoint.create(main_plot: false, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd invites Brian and Marie to Frank's party.")

PlotPoint.create(main_plot: true, project: Project.find_by(title: "It's Nice to See You Again"), description: "Todd starts flirting with Marie.")

PlotPoint.create(main_plot: true, project: Project.find_by(title: "It's Nice to See You Again"), description: "Brian punches Todd in the face.")


Chapter.create(project: Project.find_by(title: "It's Nice to See You Again"), chapter_number: 1, chapter_title: "The Meeting", summary: "Todd and Brian run into each other in Central Park.")

Chapter.find_by(chapter_title: "The Meeting").plot_points << PlotPoint.find_by(description: "Todd decides to go play football with his bestfriend, Frank, in Central Park.")
Chapter.find_by(chapter_title: "The Meeting").plot_points << PlotPoint.find_by(description: "Brian and his girlfriend, Marie, have a picnic in Central Park.")
Chapter.find_by(chapter_title: "The Meeting").plot_points << PlotPoint.find_by(description: "Todd's football lands on Brian's blanket.")
Chapter.find_by(chapter_title: "The Meeting").plot_points << PlotPoint.find_by(description: "Todd and Brian meet for the first time when Brian passes Todd his football back.")

Chapter.create(project: Project.find_by(title: "It's Nice to See You Again"), chapter_number: 2, chapter_title: "The Dinner", summary: "Todd and Brian go for drinks and dinner to catch up on the past 25 years.").plot_points << PlotPoint.find_by(description: "Todd and Brian get drinks at Ulysses.")

Chapter.find_by(chapter_title: "The Dinner").plot_points << PlotPoint.find_by(description: "Todd invites Brian and Marie to Frank's party.")

Chapter.create(project: Project.find_by(title: "It's Nice to See You Again"), chapter_number: 3, chapter_title: "The Party", summary: "A party turns sour when Todd gets a little too close to Brian's girlfriend, Marie.").plot_points << PlotPoint.find_by(description: "Todd starts flirting with Marie.")

Chapter.find_by(chapter_title: "The Party").plot_points << PlotPoint.find_by(description: "Brian punches Todd in the face.")


Character.find_by(name: "Todd Walters").chapters << Chapter.find_by(chapter_title: "The Meeting")
Character.find_by(name: "Todd Walters").chapters << Chapter.find_by(chapter_title: "The Dinner")
Character.find_by(name: "Todd Walters").chapters << Chapter.find_by(chapter_title: "The Party")

Character.find_by(name: "Brian Walters").chapters << Chapter.find_by(chapter_title: "The Meeting")
Character.find_by(name: "Brian Walters").chapters << Chapter.find_by(chapter_title: "The Dinner")
Character.find_by(name: "Brian Walters").chapters << Chapter.find_by(chapter_title: "The Party")


Character.find_by(name: "Marie Parker").chapters << Chapter.find_by(chapter_title: "The Meeting")
Character.find_by(name: "Marie Parker").chapters << Chapter.find_by(chapter_title: "The Party")

Character.find_by(name: "Frank Hill").chapters << Chapter.find_by(chapter_title: "The Meeting")
Character.find_by(name: "Frank Hill").chapters << Chapter.find_by(chapter_title: "The Party")
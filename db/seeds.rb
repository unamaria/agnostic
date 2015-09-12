admin = User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

name = Faker::Name.name
candidate = Candidate.create!(name: name,
											nickname: "Orange",
											email: Faker::Internet.email(name),
											github_username: "unamaria")

admin.candidates << candidate

position = Position.create!(title: "Web Developer",
										description: Faker::Lorem.paragraph(4))

candidate.positions << position

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end
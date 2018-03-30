admin = User.create(email: "admin@freaksidea.com", role: "admin", password:"123456")
blogger = User.create(email: "member@freaksidea.com", role: "member", password:"123456")

2.times do
  Article.create(
    author_id: admin.id
    title: Faker::Book.title,
    body: Faker::Lorem.sentence)
end

5.times do
  Article.create(
    author_id: blogger.id
    title: Faker::Book.title,
    body: Faker::Lorem.sentence)
end

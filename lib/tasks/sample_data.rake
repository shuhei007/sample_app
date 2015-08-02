namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: " ShuheiSuzuki",
                         email: "shuhei.szk@gmail.com",
                         password: "password",
                         admin: true)
    User.create!(name: "Example User",
                 email: "example@railstutorial.jp",
                 password: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password)
    end
    
    users = User.all
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    
    end
  end
end
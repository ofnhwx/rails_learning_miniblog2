# frozen_string_literal: true

User.create!(username: 'user', email: 'user@example.com', password: 'password')

10.times do
  username = Faker::Internet.unique.username
  email = Faker::Internet.unique.email
  User.create!(username: username, email: email, password: 'password')
end

users = User.order(:create_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

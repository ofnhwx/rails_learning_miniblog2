# frozen_string_literal: true

User.create!(email: 'user@example.com', password: 'password')

10.times do
  User.create!(email: Faker::Internet.email, password: 'password')
end

users = User.order(:create_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

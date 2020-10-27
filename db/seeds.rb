# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Category.exists? && Test.exists?
  categories = Category.create!([
    { category: 'Web' },
    { category: 'DevOps' },
    { category: 'AI' }
  ])

  tests = Test.create!([
    { title: "Test_1", level: 0, category_id: categories[0].id },
    { title: "Test_2", level: 1, category_id: categories[1].id },
    { title: "Test_3", level: 2, category_id: categories[2].id }
  ])

  questions = []
  tests.each.with_index(1) do |test, i|
    10.times { |n| questions << Question.create!(body: "Question_body_#{i}-#{n}", test_id: test.id) }
  end

  questions.each.with_index(1) do |question, i|
    4.times { |n| Answer.create!(body:"Answer_#{i}-#{n}", question_id: question.id, correct: (n == 1)) }
  end

  users = User.create!([
    { first_name: "John", last_name: "Doe" },
    { first_name: "John", last_name: "Galt" },
    { first_name: "Jonathan", last_name: "Livingston" }
  ])

  10.times { TestHistory.create!(user_id: users.sample.id, test_id: tests.sample.id, passed: [true, false].sample) }
end

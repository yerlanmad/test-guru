# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Category.exists? && Test.exists?
  categories = Category.create!([
    { title: 'Web' },
    { title: 'DevOps' },
    { title: 'AI' }
  ])

  tests = Test.create!([
    { title: "Test_1", level: 0, category_id: categories[0].id },
    { title: "Test_2", level: 1, category_id: categories[1].id },
    { title: "Test_3", level: 2, category_id: categories[2].id },
    { title: "Test_4", level: 3, category_id: categories[0].id },
    { title: "Test_5", level: 4, category_id: categories[1].id },
    { title: "Test_6", level: 5, category_id: categories[2].id }
  ])

  questions = []
  tests.each.with_index(1) do |test, i|
    10.times { |n| questions << test.questions.create!(body: "Question_body_#{i}-#{n}") }
  end

  questions.each.with_index(1) do |question, i|
    4.times { |n| question.answers.create!(body:"Answer_#{i}-#{n}", correct: (n == 1)) }
  end
end

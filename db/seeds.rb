# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_test(id, category)
  test = Test.create(title: "Test_#{id}", level: rand(3), category_id: category.id)
  20.times do |q|
    question = Question.create(body: "Question_body_#{id}-#{q}", test_id: test.id)
    4.times { |a| Answer.create(body:"Answer_#{id}-#{q}-#{a}", question_id: question.id) }
    Answer.where(question_id: question.id).sample.update(correct: true)
  end
end

web = Category.create(category: "Web")
1.upto(5) { |i| create_test(i, web) }

devops = Category.create(category: "DevOps")
6.upto(10) { |i| create_test(i, devops) }

ai = Category.create(category: "AI")
11.upto(15) { |i| create_test(i, ai) }

5.times { |i| User.create(first_name: "First_name#{i}", last_name: "Last_name#{i}") }

10.times { TestHistory.create(user_id: User.all.sample.id, test_id: Test.all.sample.id, passed: [true, false].sample) }

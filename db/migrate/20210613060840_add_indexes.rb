class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :questions, :body
    add_index :answers, :body
  end
end

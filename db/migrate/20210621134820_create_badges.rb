class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :icon
      t.references :category, null: true, foreign_key: true
      t.integer :level
      t.boolean :first_attempt, null: false, default: false
      t.boolean :all_in_category, null: false, default: false
      t.boolean :all_in_level, null: false, default: false

      t.timestamps
    end
  end
end

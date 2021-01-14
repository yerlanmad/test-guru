class AddTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end

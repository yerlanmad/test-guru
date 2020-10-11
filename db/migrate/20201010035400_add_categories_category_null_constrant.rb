class AddCategoriesCategoryNullConstrant < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :category, false)
  end
end

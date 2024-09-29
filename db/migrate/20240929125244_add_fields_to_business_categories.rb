class AddFieldsToBusinessCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :business_categories, :description, :string
    add_column :business_categories, :code, :string
    add_column :business_categories, :slug, :string
    add_column :business_categories, :priority, :integer
    add_column :business_categories, :publish, :boolean
    add_column :business_categories, :category_type, :string
  end
end


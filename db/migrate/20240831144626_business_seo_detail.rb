class BusinessSeoDetail < ActiveRecord::Migration[7.2]
  def change
    create_table :business_seo_profiles do |t|
      t.boolean :active, default: false
      t.string :keywords, limit: 512
      t.string :meta_tag, limit: 256
      t.string :description, limit: 256
      t.timestamps
    end
  end
end

class CreateServices < ActiveRecord::Migration[7.2]
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.integer :priority
      t.integer :status
      t.timestamps
    end
  end
end

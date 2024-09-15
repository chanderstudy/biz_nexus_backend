class CreateTableDocument < ActiveRecord::Migration[7.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :document_type
      t.integer :status
      t.integer :priority
      t.references :documentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

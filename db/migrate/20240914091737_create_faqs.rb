class CreateFaqs < ActiveRecord::Migration[7.2]
  def change
    create_table :faqs do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.references :faqable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

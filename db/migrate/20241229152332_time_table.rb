class TimeTable < ActiveRecord::Migration[7.2]
  def change
    create_table :time_tables do |t|
      t.time :monday_opening_time
      t.time :monday_closing_time
      t.time :tuesday_opening_time
      t.time :tuesday_closing_time
      t.time :wednesday_opening_time
      t.time :wednesday_closing_time
      t.time :thursday_opening_time
      t.time :thursday_closing_time
      t.time :friday_opening_time
      t.time :friday_closing_time
      t.time :saturday_opening_time
      t.time :saturday_closing_time
      t.time :sunday_opening_time
      t.time :sunday_closing_time
      t.boolean :monday_is_open, default: false, null: false
      t.boolean :tuesday_is_open, default: false, null: false
      t.boolean :wednesday_is_open, default: false, null: false
      t.boolean :thursday_is_open, default: false, null: false
      t.boolean :friday_is_open, default: false, null: false
      t.boolean :saturday_is_open, default: false, null: false
      t.boolean :sunday_is_open, default: false, null: false
      t.references :timetableable, polymorphic: true, index: true # Polymorphic reference
      t.timestamps
    end
  end
end

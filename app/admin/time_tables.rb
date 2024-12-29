ActiveAdmin.register TimeTable do
    menu parent: "Miscellaneous"
    permit_params :timetableable_type, :timetableable_id,
                :monday_is_open, :monday_opening_time, :monday_closing_time,
                :tuesday_is_open, :tuesday_opening_time, :tuesday_closing_time,
                :wednesday_is_open, :wednesday_opening_time, :wednesday_closing_time,
                :thursday_is_open, :thursday_opening_time, :thursday_closing_time,
                :friday_is_open, :friday_opening_time, :friday_closing_time,
                :saturday_is_open, :saturday_opening_time, :saturday_closing_time,
                :sunday_is_open, :sunday_opening_time, :sunday_closing_time

    index do
    selectable_column
    id_column
    column :timetableable do |timetable|
      "#{timetable.timetableable_type} ##{timetable.timetableable_id}"
    end
    %w[monday tuesday wednesday thursday friday saturday sunday].each do |day|
      column("#{day.capitalize} Is Open") { |timetable| timetable.send("#{day}_is_open") }
      column("#{day.capitalize} Opening Time") { |timetable| timetable.send("#{day}_opening_time") }
      column("#{day.capitalize} Closing Time") { |timetable| timetable.send("#{day}_closing_time") }
    end
    column :created_at
    actions
    end

    form do |f|
    f.semantic_errors
    f.inputs 'Timetable Details' do
      f.input :timetableable_type, as: :select, collection: ['BusinessCard'], prompt: 'Select Type'
      f.input :timetableable_id, label: 'Timetableable ID', as: :number
      %w[monday tuesday wednesday thursday friday saturday sunday].each do |day|
        f.input "#{day}_is_open", label: "#{day.capitalize} Is Open", as: :boolean
        f.input "#{day}_opening_time", label: "#{day.capitalize} Opening Time", as: :time_picker
        f.input "#{day}_closing_time", label: "#{day.capitalize} Closing Time", as: :time_picker
      end
    end
    f.actions
    end
end

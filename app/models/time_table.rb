class TimeTable < ApplicationRecord
  belongs_to :timetableable, polymorphic: true
  validate :validate_times

  def self.ransackable_associations(auth_object = nil)
    ["timetableable"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "friday_closing_time", "friday_is_open", "friday_opening_time", "id", "monday_closing_time", "monday_is_open", "monday_opening_time", "saturday_closing_time", "saturday_is_open", "saturday_opening_time", "sunday_closing_time", "sunday_is_open", "sunday_opening_time", "thursday_closing_time", "thursday_is_open", "thursday_opening_time", "timetableable_id", "timetableable_type", "tuesday_closing_time", "tuesday_is_open", "tuesday_opening_time", "updated_at", "wednesday_closing_time", "wednesday_is_open", "wednesday_opening_time"]
  end

  private
  def validate_times
    %w[monday tuesday wednesday thursday friday saturday sunday].each do |day|
      if send("#{day}_is_open")
        opening = send("#{day}_opening_time")
        closing = send("#{day}_closing_time")
        if opening.nil? || closing.nil?
          errors.add(:base, "#{day.capitalize}: Opening and closing times must be provided if the business is open.")
        elsif opening >= closing
          errors.add(:base, "#{day.capitalize}: Opening time must be earlier than closing time.")
        end
      end
    end
  end
end

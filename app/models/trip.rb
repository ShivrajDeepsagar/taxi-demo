class Trip < ApplicationRecord

  belongs_to :cab
  belongs_to :customer

  STATUS = %w(scheduled started completed)

  validates_inclusion_of :status, in: STATUS

  validate :end_time_after_start_time

  def end_time_after_start_time
    if (start_time.present? && end_time.present?) && (end_time < start_time)
      errors.add :end_time, 'must be after start time'
    end
  end

  def scheduled?
    status == 'scheduled'
  end

  def started?
    status == 'started'
  end

  def start_trip(lat, long)
    if scheduled?
      update_attributes(starting_lat: lat,
                        starting_long: long,
                        start_time: Time.now,
                        status: 'started')
    end
  end

  def end_trip(lat, long)
    if started?
      update_attributes(ending_lat: lat,
                        ending_long: long,
                        status: 'completed',
                        end_time: Time.now)
      cab.update_attributes(lat: lat, long: long)
    end
  end

  def caculate_and_update_amount
    fare = fare_calculator
    update_attribute(:amount, fare)
  end

  private

  def fare_calculator
    distance = Math.sqrt((ending_lat - starting_lat)**2 + (ending_long - starting_long)**2)
    time = (end_time - start_time) / 1.minutes
    color_fare = cab.color == 'pink' ? 5 : 0
    (distance * 2 + time * 1 + color_fare).round(2)
  end
end

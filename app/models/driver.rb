class Driver < ApplicationRecord
  has_many :trips

  # does anything for driver need to be unique?
  validates :name, presence: { message: "Name cannot be blank!"}
  validates :vin, presence: { message: "VIN cannot be blank!"}

  def total_earnings
    total = 0
    trips.each do |trip|
      total += trip.dollars
    end
    total = total - (total * 0.15)
    return '%.2f' % total
  end

  def average_rating
    total = 0

    trips.each do |trip|
      total += trip.rating
    end

    if trips.any? == false
      return "Nil"
    end

    total /= trips.length
    return total
  end
end

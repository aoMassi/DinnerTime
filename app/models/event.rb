class Event < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, :location, :description, :cuisine_type, :price, :places_available, :start_time, :end_time, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :places_available, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }

end

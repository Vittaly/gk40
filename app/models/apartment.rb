class Apartment < ActiveRecord::Base
  attr_accessible :apartment_number, :entrance_number, :floor, :resident_count, :room_count, :apartment_counters, :counter_types,:user_id
  has_many :apartment_counters
  has_many :monthly_readings, :order => 'month DESC'
  has_many :counter_types, through: :apartment_counters, readonly:true
  belongs_to :user,  readonly:true
end

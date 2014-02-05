class CounterType < ActiveRecord::Base
  attr_accessible :name
  has_many :apartment_counters
  has_many :apartments, through: :apartment_counters
end

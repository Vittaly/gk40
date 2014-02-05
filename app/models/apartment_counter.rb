class ApartmentCounter < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :counter_type
  has_many :meterages
   attr_accessible :counter_type_id, :apartment_id
end

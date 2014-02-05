class Meterage < ActiveRecord::Base
	attr_accessible :value, :value2, :apartment_counter, :prev
	belongs_to :monthly_reading
	belongs_to :apartment_counter
	belongs_to :prev, class_name: "Meterage"
    has_one    :next, class_name: "Meterage", foreign_key: "prev_id"
	has_one :apartment, through: :apartment_counter
	has_one :counter_type, through: :apartment_counter
end

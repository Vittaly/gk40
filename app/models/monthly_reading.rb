class MonthlyReading < ActiveRecord::Base
	attr_accessible :meterages_attributes 
	belongs_to :apartment
	belongs_to :prev, class_name: "MonthlyReading"
	has_one    :next, class_name: "MonthlyReading", foreign_key: "prev_id"

	has_many   :meterages	
	accepts_nested_attributes_for  :meterages, :allow_destroy => true
	attr_accessible :month, :prev

	validates :month,:apartment_id, presence: true
	validates_uniqueness_of :month, scope: :apartment_id

	after_create :after_crate_mr
	before_create :before_create_mr

	after_initialize do
		if self.month? then
			self.month = self.month.to_date.beginning_of_month() 
		else
			self.month = Date.today.beginning_of_month()
		end
	end;
	def month_as_text 
		return I18n.l self.month, format: :meterage_date
	end;
	def readonly?
		return  Date.today.beginning_of_month() != self.month ? true : false;
	end;
	def curent_month?
		return !readonly?
	end

	private 

	def after_crate_mr
		self.apartment.apartment_counters.each do |acounter|
			prev_meterage = nil
			prev.meterages.each { |pm| if pm.apartment_counter.counter_type_id == acounter.counter_type_id then  prev_meterage = pm end}
			if prev_meterage then
				self.meterages.create(apartment_counter: acounter, prev:prev_meterage, value: prev_meterage.value, value2: prev_meterage.value2)
			else
				self.meterages.create(apartment_counter: acounter, prev: nil, value: nil, value2: nil)
			end
		end
	end;
	def before_create_mr
		if !self.prev_id? then
			prev_monthly_readings = MonthlyReading.where("apartment_id = ? and month < ?", self.apartment_id, self.month).order("month desc").limit(1)
			self.prev = prev_monthly_readings.first if prev_monthly_readings.any?
		end    
	end;	
end

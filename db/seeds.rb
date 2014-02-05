# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
counters = CounterType.all
if counters.count == 0
	counters = CounterType.create ([{name: 'Кухня: горячая вода'}, {name: 'Кухня: холодная вода'}, {name: 'Ванная комната: горячая вода'},{name: 'Ванная комната: холодная вода'}, {name: 'Электричество'}])
end
Meterage.delete_all
MonthlyReading.delete_all
ApartmentCounter.delete_all
Apartment.delete_all	
for i in 1 .. 180
    flat_inst_count= 36
	if i != 161 
	intrance_num= i/flat_inst_count+1
	fl = (i- i/flat_inst_count*flat_inst_count-1)/4+1
		flat =  Apartment.new(apartment_number: i, entrance_number:  intrance_num, floor: fl, resident_count: 3, room_count: 2)
	else
		flat =  Apartment.new(apartment_number: i, entrance_number: 5 , floor: 4, resident_count: 3, room_count: 2,user_id: 1)
	end
	flat.counter_types = counters
	flat.save
	monthly_reading = nil
	13.downto(0)  do |m|
		monthly_reading = flat.monthly_readings.new(month: m.months.ago.to_date.beginning_of_month(), prev: monthly_reading)
		flat.apartment_counters.each  do |ct|
		     prev_meter =  monthly_reading.prev.meterages.where(apartment_counter_id: ct.id).first if monthly_reading.prev  
			buf = monthly_reading.meterages.new( apartment_counter: ct, prev: prev_meter, value: (13-m)*125+0.75)
			if ct.counter_type.name == 'Электричество' then
				buf.value2 = (13-m)*100+0.75			
			end
		end
		monthly_reading.save
	end
	flat.save
end

# -*- encoding : utf-8 -*-
class CreateApartmentAndCounters < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :entrance_number
      t.integer :floor
      t.integer :apartment_number, :unique => true
      t.integer :room_count
      t.integer :resident_count
	  t.references :user

      t.timestamps
    end
	
	create_table :counter_types do |t|
		t.string :name
		
		t.timestamps
    end
	add_index :counter_types, :name, unique: true
	
	create_table :apartment_counters do |t|
      t.references :apartment
      t.references :counter_type
      t.timestamps
    end
    add_index :apartment_counters, :apartment_id
    add_index :apartment_counters, :counter_type_id
	
	create_table :monthly_readings do |t|
      t.date :month
      t.references :apartment
	  t.integer :prev_id #предыдущий месяц
      t.timestamps
    end
    add_index :monthly_readings, [:apartment_id, :month], unique: true
	
	#показания счетчиков
 	create_table :meterages do |t|
      t.references :apartment_counter
      t.references :monthly_reading
	  t.integer :prev_id #предыдущее значение
      t.decimal :value, :precision => 8, :scale => 3
	  t.decimal :value2, :precision => 8, :scale => 3
      t.timestamps
    end
    add_index :meterages, [:apartment_counter_id, :monthly_reading_id], unique: true
	
	#объявления
	create_table :ads do |t|
	t.string :title
	t.text :text
	t.has_attached_file :picture
	t.references :user #автор
	t.timestamps
	end
	add_index :ads, :user_id
	
	#документы
	create_table :documents do |t|
	t.string :title
	t.has_attached_file :picture
	t.references :user #автор
	t.timestamps
	end
	add_index :documents, :title, unique: true
	add_index :documents, :user_id
	
	rename_column :news, :topic, :title
	
  end
end

# -*- encoding : utf-8 -*-
module UsersHelper
  def fio(user)
    "#{user.LastName} #{user.FirstName} #{user.MiddleName}"
  end
  def apartment_info(apartment)
	"Подъезд  #{apartment.entrance_number}, этаж #{apartment.floor}, квартира #{apartment.apartment_number}. Количество комнат #{apartment.room_count}, проживает #{apartment.resident_count} человек(а)."
  end
  def user_info(user)
	  'Номер лицевого счета: ' + user.Account + ' ФИО: ' + fio(user)
  end
end

# -*- encoding : utf-8 -*-
module UsersHelper
  def fio (user)
    "#{user.FirstName} #{user.MiddleName} #{user.LastName}"
  end
end

# -*- encoding : utf-8 -*-
class ChangeColumnUsersAccountNotNull < ActiveRecord::Migration
  def change
	change_column :users, :Account, :string, null: false
  end
end

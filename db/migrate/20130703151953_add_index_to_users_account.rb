# -*- encoding : utf-8 -*-
class AddIndexToUsersAccount < ActiveRecord::Migration
  def change
  add_index :users, :Account, unique: true
  add_index :users, :email, unique: true
  end
end

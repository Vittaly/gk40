# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :Account
      t.string :password_digest
      t.string :FirstName
      t.string :MiddleName
      t.string :LastName
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end

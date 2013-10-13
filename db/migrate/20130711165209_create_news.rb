# -*- encoding : utf-8 -*-
class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :topic
      t.text :content
      t.has_attached_file :picture

      t.timestamps
    end
  end
end

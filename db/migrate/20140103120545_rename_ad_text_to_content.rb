class RenameAdTextToContent < ActiveRecord::Migration
  def change
	  rename_column :ads, :text, :content
  end
end

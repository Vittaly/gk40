class DocumentsChange < ActiveRecord::Migration
  def change
	rename_column :documents, :picture_file_name, :doc_file_name
	rename_column :documents, :picture_content_type, :doc_content_type
	rename_column :documents, :picture_file_size, :doc_file_size
	rename_column :documents, :picture_updated_at, :doc_updated_at
  end
end

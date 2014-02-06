# -*- encoding : utf-8 -*-
class Document < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :doc
  has_attached_file :doc
	validates_attachment :doc,
		:content_type => { :content_type => ['image/gif','image/jpeg','image/pjpeg','image/png','image/tiff','application/msword'],
		     :message => "Только изображения и документы могут быть загружены (gif, jpeg, pjpeg, png, tiff)"},
		:size => { :in => 0..10.megabytes, :message => "Размер файла слишком большой" }
end

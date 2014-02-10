# -*- encoding : utf-8 -*-
class Ad < ActiveRecord::Base
	belongs_to :user
	attr_accessible :confirmed, :content, :picture, :title
	has_attached_file :picture, styles: { medium: '300x300', thumb: '100x100' }
	validates_attachment :picture,
		                    content_type: { content_type: ['image/gif', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/tiff'],
                    		                message: 'Только изображения могут быть загружены (gif, jpeg, pjpeg, png, tiff)' },
                    		size: { in: 0..2.megabytes, message: 'Размер файла слишком большой' }
end

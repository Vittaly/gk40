# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: news
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  content              :text
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class News < ActiveRecord::Base
	attr_accessible :content, :picture, :title
	has_attached_file :picture, styles: { medium: '300x300', thumb: '100x100' }
	validates_attachment :picture,
		                    content_type: { content_type: ['image/gif', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/tiff'],
                    		                message: 'Только изображения могут быть загружены (gif, jpeg, pjpeg, png, tiff)' },
                    		size: { in: 0..2.megabytes, message: 'Размер файла слишком большой' }
end

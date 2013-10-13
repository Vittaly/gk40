# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: news
#
#  id                   :integer          not null, primary key
#  topic                :string(255)
#  content              :text
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'spec_helper'

describe News do
  pending "add some examples to (or delete) #{__FILE__}"
end

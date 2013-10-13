# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  Account         :integer
#  password_digest :string(255)
#  FirstName       :string(255)
#  MiddleName      :string(255)
#  LastName        :string(255)
#  email           :string(255)
#  role            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end

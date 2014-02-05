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

# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :Account, :FirstName, :LastName, :MiddleName, :email, :role, :password, :password_confirmation
  has_secure_password
  
  has_one :apartment
  
  before_save { |user| user.email = email.downcase unless user.email.nil? }
  before_save { |user| user.role = :USER if user.role.nil? }
  after_initialize :default_values

  validates :Account, presence:true, uniqueness:true
  validates :FirstName, presence:true, length:{maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: {with: VALID_EMAIL_REGEX}, unless: Proc.new {|u| u.email.blank?}

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :role, inclusion: {in: %w(ADMIN USER)}


  def fio
    "#{:FirstName} #{:MiddleName} #{:LastName}"
  end

  private
  def default_values
    self.role ||= 'USER'
  end
end

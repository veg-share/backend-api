class User < ApplicationRecord
  attr_accessor :password_confirmation

  has_secure_password

  has_many :posts
  has_many :claimants

  validates :username, uniqueness: true, presence: true
  #validates :password, presence: true, confirmation: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state, presence: true
end

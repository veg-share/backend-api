class User < ApplicationRecord
  has_many :posts
  has_many :claimants

  has_one_attached :profile_image
  validate :acceptable_image
end

class User < ApplicationRecord
  has_secure_password

  attr_accessor :password_confirmation

  has_many :posts
  has_many :claimants

  has_one_attached :avatar
  validate :acceptable_avatar

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def acceptable_avatar
    return unless avatar.attached?
    unless avatar.byte_size <= 1.megabyte
      error.add(:avatar, "Image exceeds 1 MB limit")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar , "File type must be JPEG or PNG")
    end
  end
end

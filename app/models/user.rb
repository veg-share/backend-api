class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :claimants

  has_one_attached :avatar
  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?
    unless avatar.byte_size <= 1.megabyte
      error.add(:avatar, "Image exceeds 1 MB limit")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "File type must be JPEG or PNG")
    end
  end
end

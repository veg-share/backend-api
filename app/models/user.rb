class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :claimants

  has_one_attached :profile_image
  validate :acceptable_image

  def acceptable_image
    return unless profile_image.attached?
    unless profile_image.byte_size <= 1.megabyte
      error.add(:profile_image, "Image exceeds 1 MB limit")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(profile_image.content_type)
      errors.add(:profile_image, "File type must be JPEG or PNG")
    end
  end
end

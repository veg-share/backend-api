class Post < ApplicationRecord
  has_many :claimants
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?
    unless image.byte_size <= 1.megabyte
      error.add(:image, "Image exceeds 1 MB limit")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image , "File type must be JPEG or PNG")
    end
  end
end

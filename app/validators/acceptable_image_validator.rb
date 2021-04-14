class AcceptableImageValidator < ActiveModel::Validator
  def acceptable_image
    return unless profile_image.attached?
  
    unless profile_image.byte_size <= 1.megabyte
      error.add(:profile_image, "Image exceeds 1 MB limit")
    end
  end

  acceptable_types = ["image/jpeg", "image/png"]
  unless acceptable_types.include?(profile_image.content_type)
    errors.add(:profile_image, "File type must be JPEG or PNG")
  end
end
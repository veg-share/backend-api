class Post < ApplicationRecord
  has_many :claimants
  belongs_to :user#, optional: true

end

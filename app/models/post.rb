class Post < ApplicationRecord
  has_many :claimants
  belongs_to :users, optional: true

end

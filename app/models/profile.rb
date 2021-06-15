class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :user_id, uniqueness: true
end

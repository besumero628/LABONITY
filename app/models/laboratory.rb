class Laboratory < ApplicationRecord
  has_many :lab_members
  has_many :albums
  has_many :press_releases
  belongs_to :major
  belongs_to :organization, polymorphic: true

  has_one_attached :profile_image

end

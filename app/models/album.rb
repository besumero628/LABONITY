class Album < ApplicationRecord
  has_many :lab_images
  belongs_to :laboratory
end

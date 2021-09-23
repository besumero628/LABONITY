class Album < ApplicationRecord
  belongs_to :laboratory
  
  has_many_attached :images
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :images, presence: true
end

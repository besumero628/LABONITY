class Community < ApplicationRecord
  has_many :community_members
  has_many :community_messages
  
  validates :name, presence: true
  validates :introduction, presence: true
  
  has_one_attached :image
end

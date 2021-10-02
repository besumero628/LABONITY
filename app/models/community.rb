class Community < ApplicationRecord
  has_many :community_members, dependent: :destroy
  has_many :community_messages, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true
  
  has_one_attached :image
end

class Book < ApplicationRecord
  has_one_attached :figure
  
  has_many :authors, :as => :deliverable
  has_many :favorites, :as => :deliverable
  belongs_to :laboratory, optional: true
  
  validates :title, presence: true
  validates :abstract, presence: true
end

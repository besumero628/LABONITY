class Paper < ApplicationRecord
  has_one_attached :figure
  
  has_many :authors, :as => :deliverable, dependent: :destroy
  has_many :favorites, :as => :deliverable, dependent: :destroy
  belongs_to :laboratory, optional: true
  
  validates :title, presence: true
  validates :abstract, presence: true
end

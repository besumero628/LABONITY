class Confernce < ApplicationRecord
  has_one_attached :figure
  
  has_many :favorites, :as => :deliverable
  belongs_to :laboratory, optional: true
  
  validates :name, presence: true
  validates :title, presence: true
  validates :abstract, presence: true
end

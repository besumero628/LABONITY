class Paper < ApplicationRecord
  has_one_attached :figure
  
  belongs_to :laboratory
  
  validates :title, presence: true
  validates :abstract, presence: true
end

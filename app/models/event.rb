class Event < ApplicationRecord
  belongs_to :company
  
  has_many :favorites, :as => :deliverable, dependent: :destroy
  
  has_one_attached :image
end

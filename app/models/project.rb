class Project < ApplicationRecord
  belongs_to :laboratory

  validates :title, presence: true
end

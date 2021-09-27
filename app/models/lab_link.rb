class LabLink < ApplicationRecord
  belongs_to :laboratory

  validates :name, presence: true
  validates :linkpath, presence: true
end

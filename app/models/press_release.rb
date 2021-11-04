class PressRelease < ApplicationRecord
  belongs_to :laboratory

  validates :title, presence: true
  validates :body, presence: true
end

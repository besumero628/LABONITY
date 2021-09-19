class Laboratory < ApplicationRecord
  has_many :lab_members
  has_many :albums
  belongs_to :major
  belongs_to :organization, polymorphic: true
end

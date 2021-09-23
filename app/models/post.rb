class Post < ApplicationRecord
  has_many :users
  has_many :lab_members

  validates :name, presence: true
end

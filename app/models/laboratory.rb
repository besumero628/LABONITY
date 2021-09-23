class Laboratory < ApplicationRecord
  has_many :lab_members
  has_many :users, through: :lab_members
  has_many :albums
  has_many :press_releases
  has_many :papers
  has_many :confernces
  has_many :projects
  has_many :lab_links
  belongs_to :major, optional: true
  belongs_to :organization, polymorphic: true

  has_one_attached :profile_image

  validates :name, presence: true
  validates :introduction, presence: true

end

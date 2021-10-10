class Laboratory < ApplicationRecord
  has_many :lab_members, dependent: :destroy
  has_many :users, through: :lab_members, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :press_releases, dependent: :destroy
  has_many :papers, dependent: :destroy
  has_many :confernces, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :lab_links, dependent: :destroy
  has_many :schedules, :as => :affiliation, dependent: :destroy
  belongs_to :major, optional: true
  belongs_to :organization, polymorphic: true

  has_one_attached :profile_image

  validates :name, presence: true
  validates :introduction, presence: true

end

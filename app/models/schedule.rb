class Schedule < ApplicationRecord
  belongs_to :affiliation, polymorphic: true

  validates :title, presence: true
  validates :introduction, presence: true
  validates :start_time, presence: true
end

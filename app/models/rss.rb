class Rss < ApplicationRecord
  # association
  has_many :rss_choices, dependent: :destroy
  has_many :users, through: :rss_choices
end

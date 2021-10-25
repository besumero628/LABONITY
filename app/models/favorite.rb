class Favorite < ApplicationRecord
  belongs_to :deliverable, polymorphic: true
  belongs_to :user
end

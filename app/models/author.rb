class Author < ApplicationRecord
  belongs_to :deliverable, polymorphic: true
  belongs_to :user
  
  validates :deliverable_id, uniqueness: { scope: :deliverable_type }
end

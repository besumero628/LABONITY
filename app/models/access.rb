class Access < ApplicationRecord
  belongs_to :organization, polymorphic: true
end

class College < ApplicationRecord
  has_many :majors
  has_many :accesses, :as => :organization
  has_many :laboratories, :as => :organization
end

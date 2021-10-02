class College < ApplicationRecord
  has_many :majors, dependent: :destroy
  has_many :accesses, :as => :organization, dependent: :destroy
  has_many :laboratories, :as => :organization, dependent: :destroy
end

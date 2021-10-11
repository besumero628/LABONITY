class Company < ApplicationRecord
  has_one :company_admin
  has_many :schedules, :as => :affiliation, dependent: :destroy
  has_many :events, dependent: :destroy
end

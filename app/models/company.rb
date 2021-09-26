class Company < ApplicationRecord
  has_one :company_admin
  has_many :events
end

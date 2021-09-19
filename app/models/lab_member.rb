class LabMember < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory
  belongs_to :post
end

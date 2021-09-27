class Major < ApplicationRecord
  has_many :laboratories
  belongs_to :college
end

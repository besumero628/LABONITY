class CommunityMessage < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :user_id, :community_id, :body, presence: true
end

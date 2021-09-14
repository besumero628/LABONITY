class RssChoice < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :rss
end

class RssChoice < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :rss

  validate :can_not_create_rss_over_count

  private

  def can_not_create_rss_over_count
    errors.add(:base, '選択可能なrssは最大5つまでです。') if RssChoice.where(user_id: user_id).size >= 5
  end
end

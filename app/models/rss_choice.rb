class RssChoice < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :rss

  validate :can_not_create_rss_over_count

  private
  def can_not_create_rss_over_count
    if RssChoice.where(user_id: self.user_id).size >= 5
      errors.add(:base, "選択可能なrssは最大5つまでです。")
    end
  end

end

class News < ApplicationRecord
  validates :title, :body, :release_at, presence: true
  validate :release_check

  private

  # releaseが現在時刻以降かvalidation
  def release_check
    errors.add(:release_at, 'を設定する場合は、現在時刻以降を指定してください。') if Time.current > (release_at + 60) # 1分後以降から公開設定
  end
end

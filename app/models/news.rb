class News < ApplicationRecord
  validates :title, :body, :release_at, presence: true
  validate :release_check
 
    private
    # releaseが現在時刻以降かvalidation
    def release_check
        if Time.now > (release_at + 60)
            errors.add(:release_at, "を設定する場合は、現在時刻以降を指定してください。")
        end
    end
  
  
end

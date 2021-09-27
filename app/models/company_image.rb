class CompanyImage < ApplicationRecord
  has_one_attached :image

  validate :image_presence

  def image_presence
    errors.add(:image, 'ファイルを添付してください') unless self.image.attached?
  end
end

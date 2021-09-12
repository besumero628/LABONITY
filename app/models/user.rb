class User < ApplicationRecord
  include StringNormalizer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end
  
  VALID_ID_REGEX = /\A[a-z0-9]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  HUMAN_NAME_REGEXP = /\A[\p{han}\{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :login_id, presence: true, format: {with: VALID_ID_REGEX, allow_blank: true}
  validates :login_id, uniqueness: true
  validates :family_name, :given_name, presence: true, format: {with: HUMAN_NAME_REGEXP, allow_blank: true}
  validates :family_name_kana, :given_name_kana, presence: true, format: {with: KATAKANA_REGEXP, allow_blank: true}
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :post_id, presence: true
end

class User < ApplicationRecord
  include StringNormalizer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  # association
  has_many :rss_choices, dependent: :destroy
  has_many :rsses, through: :rss_choices, dependent: :destroy
  has_many :lab_members, dependent: :destroy
  has_many :laboratories, through: :lab_members, dependent: :destroy
  has_many :community_members, dependent: :destroy
  has_many :community_messages, dependent: :destroy
  has_many :communities, through: :community_members
  has_many :authors, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :favorites, dependent: :destroy

  belongs_to :post

  # 正規化
  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  # validation format
  VALID_ID_REGEX = /\A[a-z0-9]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  HUMAN_NAME_REGEXP = /\A[\p{han}{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  # validation
  validates :login_id, presence: true, format: { with: VALID_ID_REGEX, allow_blank: true }
  validates :login_id, uniqueness: true
  validates :family_name, :given_name, presence: true, format: { with: HUMAN_NAME_REGEXP, allow_blank: true }
  validates :family_name_kana, :given_name_kana, presence: true, format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :post_id, presence: true

  # urlのdefaultをlogin_idに設定
  def to_param
    login_id
  end

  # user情報変更時にpasswordの入力を不必要にする
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def user_has_edit_status?(lab)
    LabMember.where(laboratory_id: lab.id, edit_status: true).exists?(user_id: id) ? true : false
  end

  # follow
  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  # favorite
  def favorited_by?(deliverable_type, deliverable_id)
    favorites.where(deliverable_type: deliverable_type, deliverable_id: deliverable_id).exists?
  end
end

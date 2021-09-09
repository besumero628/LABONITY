require 'rails_helper'

RSpec.describe News, type: :model do
  describe "validation" do
    example "releaseの日付は現在時刻を超えたものしか登録できない。" do
      news = build(:news, release_at: Time.current)
    end
  end
end

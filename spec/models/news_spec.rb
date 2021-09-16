require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'validation' do
    example 'releaseの日付は現在時刻より前は登録できない。' do
      travel_to(Time.new(2021, 1, 2))
      news = build(:news)

      expect(news).not_to be_valid
    end
  end
end

require 'rails_helper'

feature 'News Release' do
  scenario 'release前のnewsにはアクセスできない。' do
    travel_to(Time.new(2020, 12, 30))
    news = create(:news)

    travel_to(Time.new(2020, 12, 31))
    visit public_news_path(news.id)

    expect(current_path).to eq public_root_path
  end

  scenario 'release後のnewsにはアクセスできる。' do
    travel_to(Time.new(2020, 12, 31))
    news = create(:news)

    travel_to(Time.new(2021, 1, 2))
    visit public_news_path(news.id)

    expect(current_path).to eq public_news_path(news.id)
  end
end

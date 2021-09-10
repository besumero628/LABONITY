FactoryBot.define do
  factory :news do
    title { 'テストタイトル' }
    body { 'これはテスト用の本文です。' }
    release_at { Time.new(2021, 1, 1) }
  end
end

20.times do |n|
  release_datetime = Time.now + (24 * 60 * 60 *n)
  News.create!(
    title: "LABONITY開設のお知らせ#{n}",
    body: "seed fileによるテストデータです<br>
           この記事は#{n}枚目です。",
    release_at: release_datetime
  )
end


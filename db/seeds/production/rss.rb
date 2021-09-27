Rss.create!(
  url: "http://feeds.nature.com/nature/rss/current",
  name: "Nature",
  introduction: "Nature本誌です"
)

Rss.create!(
  url: "https://www.science.org/action/showFeed?type=axatoc&feed=rss&jc=science",
  name: "Science",
  introduction: "Science本誌です"
)

Rss.create!(
  url: "https://www.cell.com/cell/inpress.rss",
  name: "Cell",
  introduction: "Cell本誌です"
)

Rss.create!(
  url: "http://feeds.nature.com/nmat/rss/current",
  name: "Nature Material",
  introduction: "Nature Material 物質化学系統の論文です。"
)

Rss.create!(
  url: "http://feeds.nature.com/nnano/rss/current",
  name: "Nature Nanotechnology",
  introduction: "Nature Nanotechnology ナノテクノロジー系統の論文です。"
)

users = User.all


  5.times do |n|
    RssChoice.create!(
      user_id: users.sample.id,
      rss_id: n+1
    )
  end



Company.create!(
  name: "panasony",
  official_mark_status: false,
  close_status: false
)

Event.create!(
  company_id: 1,
  title: "インターン募集",
  body: "2021年度インターン生を募集します。詳細はリンクから。",
  link_path: "https://www.google.com"
)
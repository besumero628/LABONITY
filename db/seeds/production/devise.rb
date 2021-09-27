# 管理者アカウント作成
Admin.create!(
  email: "labonity.info@gmail.com",
  password: "foobar"
)

# 企業管理者アカウント作成
CompanyAdmin.create!(
  email: "company@gmail.com",
  password: "password",
  login_id: "company_A",
  company_id: 1
)

User.create!(
  login_id: "testuser1",
  family_name: "山田",
  given_name: "太郎",
  family_name_kana: "ヤマダ",
  given_name_kana: "タロウ",
  email: "example1@gmail.com",
  password: "password",
  post_id: 8
)

User.create!(
  login_id: "testuser2",
  family_name: "田中",
  given_name: "二郎",
  family_name_kana: "タナカ",
  given_name_kana: "ジロウ",
  email: "example2@gmail.com",
  password: "password",
  post_id: 17,
  official_mark_status: true
)
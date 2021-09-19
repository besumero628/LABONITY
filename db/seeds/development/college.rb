College.create!(
  name: "横浜国立大学",
  official_mark_status: true
)

Major.create!(
  college_id: 1,
  faculity: "理工学部",
  department: "数物電子情報系学科",
  section: "物理工学EP"
)
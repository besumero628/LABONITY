Laboratory.create!(
  name: "武田片山研究室",
  introduction: "光を用いた固体物理学の研究室です。",
  organization_type: "College",
  organization_id: 1,
  major_id: "1",
  official_mark_status: true,
  close_status: false
)

Album.create!(
  laboratory_id: 1,
  name: "歓迎会",
  introduction: "研究室発足の歓迎会を行いました！"
)

LabMember.create!(
  user_id: 1,
  laboratory_id: 1,
  post_id: 8,
  authority_status: false,
  edit_status: false,
  enrolled_status: true,
  main_status: true,
  flex_status: true,
  permit_status: true,
)

LabMember.create!(
  user_id: 2,
  laboratory_id: 1,
  post_id: 17,
  authority_status: true,
  edit_status: true,
  enrolled_status: true,
  main_status: true,
  flex_status: true,
  permit_status: true,
)

PressRelease.create!(
  title: "研究室発足のお知らせ",
  body: "研究室を発足しました。意欲のある研究生を募集しています。",
  linkpath: "https://www.nature.com/",
  laboratory_id: 1
)
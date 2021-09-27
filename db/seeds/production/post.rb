posts = %w{
  学士1年/B1
  学士2年/B2
  学士3年/B3
  学士4年/B4
  学士5年/B5
  学士6年/B6
  修士1年/M1
  修士2年/M2
  博士1年/D1
  博士2年/D2
  博士3年/D3
  ポスドク/Postdoc
  助手/research\ assistant
  助教/research\ associate
  講師/lecturer
  准教授/associate\ professor
  教授/professor
  会社員/office\ worker
  その他/ther
}

posts.each do |post|
  Post.create!(
    name: post
  )
end
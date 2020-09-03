# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  self_instoduction = "宜しくお願いします！"
  password = "password"
  User.create!(name:  name,
               email: email,
               self_instoduction: self_instoduction,
               password:              password,
               password_confirmation: password)
end
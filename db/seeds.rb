# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

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
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Comic.create!(title:       "NARUTO―ナルト―",
              author_name: "岸本斉史",
              content:     "ここは木ノ葉隠れの里。忍術学校の問題児、ナルトは今日もイタズラ三昧!!　そんなナルトのでっかい夢は歴代の勇者、火影の名を受けついで、先代を越える忍者になることだ。だがナルトには出生の秘密が…!?",
              genre:       "少年漫画" )

Comic.create!(title:       "進撃の巨人",
              author_name: "諫山創",
              content:     "手足をもがれ、餌と成り果てようと、人類は巨人に挑む!!　巨人がすべてを支配する世界。巨人の餌と化した人類は巨大な壁を築き、壁外への自由と引き換えに侵略を防いでいた。だが名ばかりの平和は壁を越える大巨人の出現により崩れ、絶望の戦いが始まってしまう。――震える手で、それでもあなたはページを捲る。超大作アクション誕生！　これが21世紀の王道少年漫画だ!!",
              genre:       "少年漫画" )
              

              
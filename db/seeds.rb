User.create!(name:  "室井佑月",
             unique_name: "muroi",
             email: "example@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "佐藤誠",
             unique_name: "sato1980",
             email: "example@railstutorial2.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "あしべゆうほ",
             unique_name: "ashibe_yuho",
             email: "example@railstutorial3.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)
          
User.create!(name:  "フルカワミキ",
             unique_name: "hurukawamiki",
             email: "example@railstutorial4.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)
          
User.create!(name:  "けんずろう",
             unique_name: "kenzuro2021",
             email: "example@railstutorial5.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "下山大地",
             unique_name: "shimoyama",
             email: "example@railstutorial6.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)




Comic.create!(title:       "NARUTO―ナルト―",
              author_name: "岸本斉史",
              content:     "ここは木ノ葉隠れの里。忍術学校の問題児、ナルトは今日もイタズラ三昧!!　そんなナルトのでっかい夢は歴代の勇者、火影の名を受けついで、先代を越える忍者になることだ。だがナルトには出生の秘密が…!?",
              genre:       "少年漫画" )

Comic.create!(title:       "進撃の巨人",
              author_name: "諫山創",
              content:     "手足をもがれ、餌と成り果てようと、人類は巨人に挑む!!　巨人がすべてを支配する世界。巨人の餌と化した人類は巨大な壁を築き、壁外への自由と引き換えに侵略を防いでいた。だが名ばかりの平和は壁を越える大巨人の出現により崩れ、絶望の戦いが始まってしまう。――震える手で、それでもあなたはページを捲る。超大作アクション誕生！　これが21世紀の王道少年漫画だ!!",
              genre:       "少年漫画" )


Comic.create!(title:       "約束のネバーランド",
              author_name: "白井カイウ/出水ぽすか",             
              content:     "母と慕う彼女は親ではない。共に暮らす彼らは兄弟ではない。エマ・ノーマン・レイの三人はこの小さな孤児院で幸せな毎日を送っていた。しかし、彼らの日常はある日突然終わりを告げた。真実を知った彼らを待つ運命とは…!?…",
              genre:       "少年漫画")

Comic.create!(title:       "Dr.STONE",
              author_name: "稲垣理一郎/Boichi",             
              content:     "一瞬にして世界中すべての人間が石と化す、謎の現象に巻き込まれた高校生の大樹。数千年後――。目覚めた大樹とその友・千空はゼロから文明を作ることを決意する!! 空前…",
              genre:       "少年漫画")

Comic.create!(title:       "ONE PIECE",
              author_name: "尾田栄一郎",             
              content:     "時は大海賊時代。いまや伝説の海賊王G・ロジャーの遺した『ひとつなぎの大秘宝』を巡って、幾人もの海賊達が戦っていた。そんな海賊に憧れる少年ルフィは、海賊王目指して大いなる旅に出る!!",
              genre:       "少年漫画")
            
Comic.create!(title:       "僕のヒーローアカデミア",
              author_name: "堀越耕平",             
              content:     "多くの人間が“個性”という力を持つ。だが、それは必ずしも正義の為の力ではない。しかし、避けられぬ悪が存在する様に、そこには必ず我らヒーローがいる！ ん？ 私が誰かって？ HA―HA―HA―HA―HA！ さぁ、始まる…",
              genre:       "少年漫画")
            
Comic.create!(title:       "ハイキュー!!",
              author_name: "古舘春一",             
              content:     "おれは飛べる!! バレーボールに魅せられ、中学最初で最後の公式戦に臨んだ日向翔陽。だが、「コート上の王様」と異名を取る天才選手・影山に惨敗してしまう。リベンジを誓い烏野高校バレー部の門を叩く日向だが!?",
              genre:       "少年漫画")
             
Comic.create!(title:       "キン肉マン",
              author_name: "ゆでたまご",             
              content:     "怪獣に負けてばかりのドジなヒーロー・キン肉マン。しかし、その正体は宇宙一のヒーロー一族・キン肉星の王子だった！ 故郷の危機を救うため、星に舞い戻ったキン肉マンを待ち受けていた強敵は…!?",
              genre:       "少年漫画")

Comic.create!(title:       "BLEACH",
              author_name: "久保帯人",             
              content:     "黒崎一護・15歳・ユウレイの見える男。その特異な体質のわりに安穏とした日々を送っていた一護だが、突如、自らを死神と名乗る少女と遭遇、「虚」と呼ばれる悪霊に襲われる。次々と倒れる家族を前に一護は!?",
              genre:       "少年漫画")
            
Comic.create!(title:       "チェンソーマン",
              author_name: "藤本タツキ",             
              content:     "悪魔のポチタと共にデビルハンターとして借金取りにこき使われる超貧乏な少年・デンジ。ド底辺の日々は、残忍な裏切りで一変する!! 悪魔をその身に宿し、悪魔を狩る、新時代ダークヒーローアクション、開幕！…",
              genre:       "少年漫画")
            

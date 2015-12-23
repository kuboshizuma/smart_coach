# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#### == User == ####
user1 = User.where(email: "admin@gmail.com").first_or_initialize
user1.password = "aaaaaaaa"
user1.nickname = "admin"
user1.age = 100
user1.avatar = ""
user1.introduce = "i am admin"
user1.belong = "admin"
user1.twitter = "https://twitter.com/fcbarcelona_jp"
user1.facebook = "https://www.facebook.com/techcampp/"
user1.skip_confirmation!
user1.save!

user2 = User.where(email: "coach1@gmail.com").first_or_initialize
user2.password = "aaaaaaaa"
user2.nickname = "星野仙一"
user2.age = 40
user2.avatar = open("#{Rails.root}/db/data/users/baseboll_coach.jpg")
user2.introduce = "よろしくお願いします。"
user2.belong = "阪神タイガース"
user2.twitter = "https://twitter.com/fcbarcelona_jp"
user2.facebook = "https://www.facebook.com/techcampp/"
user2.skip_confirmation!
user2.save!

user3 = User.where(email: "coach2@gmail.com").first_or_initialize
user3.password = "aaaaaaaa"
user3.nickname = "為末大"
user3.age = 30
user3.avatar = open("#{Rails.root}/db/data/users/track_coach.jpg")
user3.introduce = "よろしくお願いします。"
user3.belong = "大阪ガス"
user3.twitter = "https://twitter.com/fcbarcelona_jp"
user3.facebook = "https://www.facebook.com/techcampp/"
user3.skip_confirmation!
user3.save!

user4 = User.where(email: "coach3@gmail.com").first_or_initialize
user4.password = "aaaaaaaa"
user4.nickname = "松岡修造"
user4.age = 30
user4.avatar = open("#{Rails.root}/db/data/users/tennis_coach.jpg")
user4.introduce = "よろしくお願いします。"
user4.belong = "テニス部"
user4.twitter = "https://twitter.com/fcbarcelona_jp"
user4.facebook = "https://www.facebook.com/techcampp/"
user4.skip_confirmation!
user4.save!

user5 = User.where(email: "coach4@gmail.com").first_or_initialize
user5.password = "aaaaaaaa"
user5.nickname = "ザッケローニ"
user5.age = 60
user5.avatar = open("#{Rails.root}/db/data/users/soccer_coach.jpeg")
user5.introduce = "よろしくお願いします。"
user5.belong = "日本代表"
user5.twitter = "https://twitter.com/fcbarcelona_jp"
user5.facebook = "https://www.facebook.com/techcampp/"
user5.skip_confirmation!
user5.save!

user6 = User.where(email: "student1@gmail.com").first_or_initialize
user6.password = "aaaaaaaa"
user6.nickname = "野球少年"
user6.age = 65
user6.avatar = open("#{Rails.root}/db/data/users/baseball_boy.jpg")
user6.introduce = "よろしくお願いします。"
user6.belong = "東京高校野球部"
user6.twitter = "https://twitter.com/fcbarcelona_jp"
user6.facebook = "https://www.facebook.com/techcampp/"
user6.skip_confirmation!
user6.save!

user7 = User.where(email: "student2@gmail.com").first_or_initialize
user7.password = "aaaaaaaa"
user7.nickname = "陸上少年"
user7.age = 76
user7.avatar = open("#{Rails.root}/db/data/users/track_boy.jpg")
user7.introduce = "よろしくお願いします。"
user7.belong = "神奈川高校陸上部"
user7.twitter = "https://twitter.com/fcbarcelona_jp"
user7.facebook = "https://www.facebook.com/techcampp/"
user7.skip_confirmation!
user7.save!

user8 = User.where(email: "student3@gmail.com").first_or_initialize
user8.password = "aaaaaaaa"
user8.nickname = "テニス少年"
user8.age = 87
user8.avatar = open("#{Rails.root}/db/data/users/tennis_boy.jpg")
user8.introduce = "よろしくお願いします。"
user8.belong = "札幌高校テニス部"
user8.twitter = "https://twitter.com/fcbarcelona_jp"
user8.facebook = "https://www.facebook.com/techcampp/"
user8.skip_confirmation!
user8.save!

user9 = User.where(email: "student4@gmail.com").first_or_initialize
user9.password = "aaaaaaaa"
user9.nickname = "サッカー少年"
user9.age = 98
user9.avatar = open("#{Rails.root}/db/data/users/soccer_boy.jpg")
user9.introduce = "よろしくお願いします。"
user9.belong = "福岡高校サッカー部"
user9.twitter = "https://twitter.com/fcbarcelona_jp"
user9.facebook = "https://www.facebook.com/techcampp/"
user9.skip_confirmation!
user9.save!


#### == Genre == ####

genre1 = Genre.where(name: "野球", color: "F66B51").first_or_create
genre2 = Genre.where(name: "陸上", color: "FFCB6B").first_or_create
genre3 = Genre.where(name: "テニス", color: "B6D56D").first_or_create
genre4 = Genre.where(name: "サッカー", color: "61CBC1").first_or_create


#### == Lesson == ####
Lesson.create(
  title: "【バッティングフォームに不安がある人必見】名監督が徹底的に正しいフォームを伝授！",
  desc_goal: "徹底練習であなたのバッティングフォームを劇的に改善します",
  desc_who: "バッティングフォームの基礎を身につけたい人",
  desc_what: "素振り、ノック、フォーム修正を徹底的にこなします",
  desc_other: "",
  thumbnail: open("#{Rails.root}/db/data/lessons/baseball_1.jpg"),
  coach_id: user1.id,
  genre_id: genre1.id,
  start_day: Date.parse('2015-12-26 12:00'),
  month: 1,
  lesson_shifts_attributes: {
    "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
    "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
  },
  shift_minutes: 840
  )

Lesson.create(
  title: "【この冬で一気にライバルに差をつけよう】名門駅伝チームの監督が教える冬のトレーニング",
  desc_goal: "長距離を楽々こなすための基礎体力向上を目指します",
  desc_who: "冬季に差を付けたい人、体力向上が課題の人",
  desc_what: "長距離トレーニング",
  desc_other: "",
  thumbnail: open("#{Rails.root}/db/data/lessons/trach-and-field_1.jpg"),
  coach_id: user2.id,
  genre_id: genre2.id,
  start_day: Date.parse('2015-12-26 12:00'),
  month: 1,
  lesson_shifts_attributes: {
    "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
  },
  shift_minutes: 420

  )

Lesson.create(
  title: "【もっと熱くなれよ!!!】本気でトップを目指す人のための熱血テニス授業",
  desc_goal: "テニスでトップをとるための技術、体力、気力を身につけます",
  desc_who: "テニスにすべてを捧げたい人",
  desc_what: "短期集中合宿メニュー",
  desc_other: "熱くなれよ!!",
  thumbnail: open("#{Rails.root}/db/data/lessons/tennis.png"),
  coach_id: user3.id,
  genre_id: genre3.id,
  start_day: Date.parse('2015-12-26 12:00'),
  month: 1,
  lesson_shifts_attributes: {
    "0": { weekday: 0, start_time: '13:00', finish_time: '17:00' },
  },
  shift_minutes: 240
  )

Lesson.create(
  title: "【プロのサッカー選手を目指す】決定力不足に悩むあなたに。プロのコーチによる徹底シュート練習!",
  desc_goal: "決定力のあるシュートを身につけます",
  desc_who: "決定力に欠ける人、シュートに自信がない人",
  desc_what: "シュート練習、フォーム改善",
  desc_other: "",
  thumbnail: open("#{Rails.root}/db/data/lessons/soccer.jpeg"),
  coach_id: user4.id,
  genre_id: genre4.id,
  start_day: Date.parse('2015-12-26 12:00'),
  month: 1,
  lesson_shifts_attributes: {
    "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
    "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
  },
  shift_minutes: 840
  )
4.times do
  Lesson.create(
    title: "【もっと熱くなれよ!!!】本気でトップを目指す人のための熱血サッカー授業",
    desc_goal: "決定力のあるシュートを身につけます",
    desc_who: "決定力に欠ける人、シュートに自信がない人",
    desc_what: "シュート練習、フォーム改善",
    desc_other: "",
    thumbnail: open("#{Rails.root}/db/data/lessons/soccer_2.jpg"),
    coach_id: user4.id,
    genre_id: genre4.id,
    start_day: Date.parse('2015-12-26 12:00'),
    month: 1,
    lesson_shifts_attributes: {
      "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
      "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
    },
    shift_minutes: 840
    )

  Lesson.create(
    title: "【この冬で一気にライバルに差をつけよう】名門テニスチームの監督が教える冬のトレーニング",
    desc_goal: "テニスでトップをとるための技術、体力、気力を身につけます",
    desc_who: "決定力に欠ける人、シュートに自信がない人",
    desc_what: "シュート練習、フォーム改善",
    desc_other: "",
    thumbnail: open("#{Rails.root}/db/data/lessons/tennis_2.jpg"),
    coach_id: user3.id,
    genre_id: genre3.id,
    start_day: Date.parse('2015-12-26 12:00'),
    month: 1,
    lesson_shifts_attributes: {
      "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
      "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
    },
    shift_minutes: 840
    )

  Lesson.create(
    title: "【走行フォームに不安がある人必見】名コーチが徹底的に正しいフォームを伝授！",
    desc_goal: "決定力のあるシュートを身につけます",
    desc_who: "決定力に欠ける人、シュートに自信がない人",
    desc_what: "シュート練習、フォーム改善",
    desc_other: "",
    thumbnail: open("#{Rails.root}/db/data/lessons/track-and-field_2.jpg"),
    coach_id: user2.id,
    genre_id: genre2.id,
    start_day: Date.parse('2015-12-26 12:00'),
    month: 1,
    lesson_shifts_attributes: {
      "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
      "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
    },
    shift_minutes: 840
    )

  Lesson.create(
    title: "【プロの野球選手を目指す】コントロール不足に悩むあなたに。プロのコーチによる徹底ピッチング練習!",
    desc_goal: "決定力のあるシュートを身につけます",
    desc_who: "決定力に欠ける人、シュートに自信がない人",
    desc_what: "シュート練習、フォーム改善",
    desc_other: "",
    thumbnail: open("#{Rails.root}/db/data/lessons/baseball_2.jpeg"),
    coach_id: user1.id,
    genre_id: genre1.id,
    start_day: Date.parse('2015-12-26 12:00'),
    month: 1,
    lesson_shifts_attributes: {
      "0": { weekday: 0, start_time: '12:00', finish_time: '19:00' },
      "1": { weekday: 1, start_time: '12:00', finish_time: '19:00' }
    },
    shift_minutes: 840
    )
end

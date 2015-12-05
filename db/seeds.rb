# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#### == User == ####
user1 = User.first_or_initialize(email: "example1@gmail.com")
user1.password = "aaaaaaaa"
user1.skip_confirmation!
user1.save!

user2 = User.first_or_initialize(email: "example2@gmail.com")
user2.password = "aaaaaaaa"
user2.skip_confirmation!
user2.save!


#### == Genre == ####
genre1 = Genre.first_or_create(name: "野球")
genre2 = Genre.first_or_create(name: "陸上")


#### == Lesson == ####
Lesson.create(title: "【バッティングフォームに不安がある人必見】名監督が徹底的に正しいフォームを伝授！", description: "【バッティングフォームに不安がある人必見】名監督が徹底的に正しいフォームを伝授！", thumbnail: open("#{Rails.root}/db/data/lessons/baseball_1.jpg"), coach_id: user1.id, genre_id: genre1.id)
Lesson.create(title: "【この冬で一気にライバルに差をつけよう】名門駅伝チームの監督が教える冬のトレーニング", description: "【この冬で一気にライバルに差をつけよう】名門駅伝チームの監督が教える冬のトレーニング", thumbnail: open("#{Rails.root}/db/data/lessons/trach-and-field_1.jpg"), coach_id: user2.id, genre_id: genre2.id)

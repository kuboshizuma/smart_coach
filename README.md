# スマートコーチ
「スマートコーチ」は「スマホで受けれる！スポーツのプライベートコーチ」を実現するためのアプリケーションです。

# 動作環境
- Ruby 2.2
- Ruby on Rails 4.2
- MySQL 5.6

# 開発環境動作手順

## リポジトリのクローン

```
$ git clone git@github.com:kuboshizuma/smart_coach.git
```

## Gemライブラリのインストール

```
bundle install
```

## 環境変数の準備

```
cp dot.env .env
```

以下のように「.env」にデータベースのusername、passwordを記入。(適宜)

```rb
DATABASE_USER=root
DATABASE_PASSWORD=root
```

## データベースの作成・準備

```
bundle exec rake db:create
bundle exec rake db:migrate
```

## Ruby on Rails の起動

```
bundle exec rails s
```


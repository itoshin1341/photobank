# アプリケーション名
Photo Bank(フォトバンク)

# 概要
- 新規登録機能
- ログイン・ログアウト機能
- ユーザー情報登録・編集機能(予定)
- 画像投稿機能(予定)
- 画像覚助機能(予定)
- 画像情報にコメントができる機能(予定)

# 本番環境


## ログイン情報(テスト用)
- Eメール：
- パスワード：

# ペルソナ
- 性別 主に男性
- 年齢 60代後半
- 職業 定年退職者

# ユーザーストーリー
- 自分の父親にフォーカスを当てる。
- 昔撮っていた写真（いまは無き地元の建物・街並み・電車etc..）を共有できる。
- 上記の情報をユーザー同士で共有・コメントし合える。

# 制作背景(意図)
コロナ禍で外部でのコミュニケーションがとりづらい状況下であっても、
退職後、第二の人生を楽しんでほしいという思いで作成しました。
TwitterやFacebookは素晴らしいコンテンツですが、
それを使いこなすには年齢的に個人差が出やすいので、
とにかく見やすい、操作のしやすいWebアプリケーションになるようこだわりました。

# DEMO

# 工夫したポイント

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, Scss, JavaScript

## データベース
MySQL, SequelPro

## インフラ
Heroku, AWS()

## Webサーバ

## アプリケーションサーバ

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
Googleマップのストリートビューは最新で昔の情報は少ない為、
Googleマップを活用し、より直感的に操作ができるようにしたいと思っています。

# DB設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | unique: true, null: false |
| encrypted_password | string  | null: false               |
| prefecture_id      | integer | null: false               |
| city               | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| gender_id          | integer | null: false               |
| birthday           | date    | null: false               |
| introduction       | text    | null: false               |

### Association

- has_many :tweets
- has_many :comments

## Tweetsテーブル

| Column        | Type       | Options                       |
| --------------| ---------- | ----------------------------- |
| user          | references | null: false, foreign_key:true |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| title         | integer    | null: false                   |
| description   | text       | null: false                   |

### Association

- belongs_to :user
- has_many :comments

## Commentsテーブル

| Column  | Type       | Options                       |
| --------| ---------- | ----------------------------- |
| user    | references | null: false, foreign_key:true |
| message | text       | null: false                   |

### Association

- belongs_to :user
- belongs_to :tweet
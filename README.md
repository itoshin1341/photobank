# アプリケーション名
Photo Bank(フォトバンク)

# 概要
- 新規ユーザー登録機能
- ログイン・ログアウト機能
- 新規投稿機能
- 投稿編集機能
- 投稿削除機能
- コメント機能(予定)
- いいね！機能(予定)

# 本番環境
https://photobank-35411.herokuapp.com/

## ログイン情報(テスト用)
- Eメール：taro-yamada-2021@gmail.com
- パスワード：taro1234

# ペルソナ
- 性別 主に男性
- 年齢 60代後半
- 職業 主に定年退職者

# ユーザーストーリー
- 自分の父親にフォーカスを当てる。
- 昔撮っていた写真（いまは無き地元の建物・街並み・電車etc..）を共有できる。
- 上記の情報をユーザー同士で共有・コメントし合える。

# 制作背景(意図)
コロナ禍で外部でのコミュニケーションがとりづらい状況下であっても、
退職後、第二の人生を楽しんでほしいという思いで作成しました。

# DEMO

# 工夫したポイント
とにかく見やすく、操作のしやすいWebアプリケーションになるようこだわりました。
TwitterやFacebookは素晴らしいコンテンツですが、それを使いこなすには年齢的に個人差が出やすいので、どの年代でも利用できるように配慮しました。

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, Scss, JavaScript

## データベース
MySQL, SequelPro

## インフラ（開発環境）
Heroku, AWS

## Webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn（予定）

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec（予定）

## エディタ
VSCode

# 課題や今後実装したい機能
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
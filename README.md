# アプリケーション名
Photo Bank (フォトバンク)

# 概要
当時の懐かしい写真、アルバムの中に眠っていませんか。
その写真をインターネットへ公開し、それを見て懐かしむ世代が集ってくる。
そうすることで、思い出を共有する交流の場を作り上げる事ができればいいのではないでしょうか？
それをお手伝いできるのが 「Photo Bank」です。
あなたも Photo Bank に触れてみて、一緒に思い出を作り上げていきませんか？

# 本番環境
http://18.180.124.193

ログイン情報(テスト用)
- Eメール：taro-yamada-2021@gmail.com
- パスワード：taro1234

# ペルソナ
- 性別 主に男性
- 年齢 60代後半
- 職業 無職（定年退職者）

# ユーザーストーリー
- 自分の父親にフォーカスを当てる。
- 昔撮っていた写真（いまは無き地元の建物・街並み・電車・玩具etc..）を共有できる。
- 上記の情報をユーザー同士で共有・コメントし合える。

# 制作背景(意図)
テクノロジーをよく知らない高齢の方々を中心にも、
その素晴らしさを実感できるようなアプリケーションがほしいと思っていました。
退職後、コロナ禍で外部でのコミュニケーションがとりづらい状況下であっても、
第二の人生をしっかり楽しんでほしいという思いで作成しました。

# 機能一覧
- 新規ユーザー登録機能
- ログイン・ログアウト機能
- 新規投稿機能
- 投稿編集機能
- 投稿削除機能
- コメント機能
- プレビュー機能
- 複数枚画像投稿機能(予定)
- いいね！機能(予定)

# DEMO
準備中です。

# 工夫したポイント
とにかく見やすく、操作のしやすいWebアプリケーションになるようこだわりました。
世間で普及しているTwitterやFacebookは素晴らしいコンテンツです。
しかし、それを使いこなすには年齢的に個人差が出やすいので、どの年代でも利用できるように配慮しました。

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, Scss, JavaScript,jQuery

## データベース
MySQL, SequelPro

## インフラ（開発環境）
AWS(EC2),Capistrano

## Webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
APIでGoogleマップを活用し、より直感的に操作ができるようにしたいと思っています。

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

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| text      | text       | null: false                   |
| user      | references | null: false, foreign_key:true |
| tweet     | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :tweet
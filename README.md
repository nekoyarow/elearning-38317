# テーブル設計

## usersテーブル

| Column                | Type     | Options     | 
| --------------------- | -------- | ----------- | 
| family_name           | string   | null: false | 
| first_name            | string   | null: false | 
| family_name_kana      | string   | null: false | 
| first_name_kana       | string   | null: false | 
| email                 | string   | null: false | 
| encrypted_password    | string   | null: false | 
| company_id            | integer  | null: false | 
| division_id           | integer  | null: false | 
| station_id            | integer  |             | 

### Association
- has_many :learnings
- has_many :plays
- belongs_to :company（アクティブハッシュ）
- belongs_to :division（アクティブハッシュ）
- belongs_to :station（アクティブハッシュ）

### ActiveHash
- company
- division
- station


## learningsテーブル

| Column      | Type       | Options                        | 
| ----------- | ---------- | ------------------------------ | 
| title       | string     | null: false                    | 
| category_id | integer    | null: false                    | 
| comment     | text       | null: false                    | 
| user        | references | foreign_key: true, null: false | 

### Association
- belongs_to :user
- has_many :questions
- has_many :plays
- belongs_to :category（アクティブハッシュ）

### ActiveHash
- category


## questionsテーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| question       | text       | null: false                    | 
| is_answer_1    | boolean    | null: false, default: false    | 
| content_1      | string     | null: false                    | 
| is_answer_2    | boolean    | null: false, default: false    | 
| content_2      | string     | null: false                    | 
| description    | text       |                                | 
| learning       | references | foreign_key: true, null: false | 

### Association
- belongs_to :learning


## playsテーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| user     | references | foreign_key: true, null: false | 
| learning | references | foreign_key: true, null: false | 

### Association
- belongs_to :user
- belongs_to :learning
- has_many :answers


## answersテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| answer | boolean    | null: false, default: false    | 
| play   | references | foreign_key: true, null: false | 

### Association
- belongs_to :play

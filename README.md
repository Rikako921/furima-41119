# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kanafirst_name     | string | null: false |
| kanalast_name      | string | null: false |
| birthday           | date   | null: false |



### Association

- has_many :comments
- has_many :posts
- has_many :boughts


## posts テーブル

| Column        | Type       | Options     |
| ------        | ------     | ----------- |
| title         | string     | null: false |
| contents      | text       | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| ship_charge_id| integer   | null: false |
| ship_from_id  | integer    | null: false |
| ship_long_id  | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |



### Association

- has_many :comments
- has_one :bought
- belongs_to :user

##  commentテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment | text       | null: false |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |


### Association

- belongs_to :post
- belongs_to :user

## bought テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
- has_one :arrived_at

## arrived_at テーブル

| Column       |  Type      | Options                        |
| -------      | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture_id| string     | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| tell_number  | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
 

### Association

- belongs_to :bought


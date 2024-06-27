# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kanafirst_name     | string | null: false |
| kanalast_name      | string | null: false |
| birthday_year      | date | null: false |
| birthday_month     | date | null: false |
| birthday_days      | date | null: false |


### Association

- has_many :comments
- has_many :posts

## posts テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| title      | string     | null: false |
| text       | text       | null: false |
| category   | string     | null: false |
| condition  | string     | null: false |
| ship_charge | integer   | null: false |
| ship_from  | string     | null: false |
| ship_long  | integer    | null: false |
| price      | integer    | null: false |
| user_id    | references | null: false, foreign_key: true |



### Association

- has_many :comments
- has_one :bought
- belongs_to :user

##  commentテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment | text       | null: false |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |


### Association

- belongs_to :post
- belongs_to :user

## bought テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- has_one :arrived_at

## arrived_at テーブル

| Column     |  Type      | Options                        |
| -------    | ---------- | ------------------------------ |
| post_code  | string     | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| building   | string     | null: false |
| tell_number| string     | null: false |
| user_id    | references | null: false, foreign_key: true |
 

### Association

- belongs_to :bought


## Usersテーブル

|Column  |Type  |Options                  |
|--------|------|-------------------------|
|nickname|string|null: false, unique: true|
|email   |string|null: false, unique: true|
|password|string|null: false              |

### Association
- has_many :cookings
- has_many :favorites

## Cookingsテーブル

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|cooking_name  |string    |null: false                   |
|category_id   |integer   |null: false                   |
|user_id       |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :favorites
- has_one :recipe

## Favoritesテーブル

|Column    |Type   |Options                       |
|----------|-------|------------------------------|
|user_id   |integer|null: false, foreign_key: true|
|cooking_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy
- belongs_to :cooking, dependent: :destroy

## Recipesテーブル

|Column    |Type   |Options                       |
|----------|-------|------------------------------|
|plate     |integer|null: false                   |
|ingredient|text   |null: false                   |
|process   |text   |null: false                   |
|duration  |integer|null: false                   |
|cooking_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cooking, dependent: :destroy
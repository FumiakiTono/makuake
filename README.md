#users
|カラム名|型|オプション|
|:---|:-----|:------|
|email|string|unique, nit null|
|name|string|not null, index|
|password|string|not null|
- has_many :projects, through: :project_users
- has_many :courses, through: :course_users
- has_many :items, through: :item_users

#projects
|カラム名|型|オプション|
|:---|:-----|:------|
|title|string|not null, index, unique|
|description|text|not null|
|category|string|not null|
|patern|string|not null|
|finaldate|date|not null|
|currentprice|integer|not null, index|
|finalprice|integer|not null|
- has_many :items
- has_many :users, through: :project_users

#cources
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, index, unique|
|image|string||
|project_id|references|foreign_key|
|price|integer|not null, index|
|color|string||
- belongs_to :projects
- has_many :users, through: :course_users

#products
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, unique, index|
|image|string||
- has_many :items

#items
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, index, unique|
|image|string||
|product_id|references|foreign_key|
|count|integer||
- belongs_to :products
- has_many :users, through: :item_users

#course_users
|カラム名|型|オプション|
|:---|:-----|:------|
|course_id|references|foreign_key|
|user_id|references|foreign_key|
- belongs_to :courses
- belongs_to :users

#item_users
|カラム名|型|オプション|
|:---|:-----|:------|
|item_id|references|foreign_key|
|user_id|references|foreign_key|
- belongs_to :items
- belongs_to :users

#project_users
|カラム名|型|オプション|
|:---|:-----|:------|
|project_id|references|foreign_key|
|user_id|references|foreign_key|
- belongs_to :projects
- belongs_to :users

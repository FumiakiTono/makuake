# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
#users
|カラム名|型|オプション|
|:---|:-----|:------|
|email|string|unique, nit null|
|name|string|not null, index|
|password|string|not null|

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

#cources
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, index, unique|
|image|string||
|project_id|references|foreign_key|
|price|integer|not null, index|
|color|string||

#products
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, unique, index|
|image|string||

#items
|カラム名|型|オプション|
|:---|:-----|:------|
|name|string|not null, index, unique|
|image|string||
|product_id|references|foreign_key|
|count|integer||

#course_users
|カラム名|型|オプション|
|:---|:-----|:------|
|course_id|references|foreign_key|
|user_id|references|foreign_key|

#item_users
|カラム名|型|オプション|
|:---|:-----|:------|
|item_id|references|foreign_key|
|user_id|references|foreign_key|

#project_users
|カラム名|型|オプション|
|:---|:-----|:------|
|project_id|references|foreign_key|
|user_id|references|foreign_key|

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

class Project < ApplicationRecord
  has_many :users, through: :project_users
  has_many :project_users
  # accepts_nested_attributes_for :users
  has_many :favorites
  has_many :users, through: :favorites
end

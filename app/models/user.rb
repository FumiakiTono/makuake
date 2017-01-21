class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :projects
  has_many :favorites
  has_many :projects, through: :favorites
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :follower, through: :passive_relationships, source: :follower

  def follow(current_user, other_user)
    active_relationships.create(following_id: current_user.id, follower_id: other_user.id)
  end

  def unfollow(current_user, other_user)
    active_relationships.find_by(following_id: current_user.id, follower_id: other_user.id).destroy
  end

  def following?(current_user, other_user)
    current_user.active_relationships.pluck(:follower_id).include?(other_user.id)
  end

  def followings(id)
    relationships = Relationship.where(following_id: id)
    users = []
    relationships.each do |relationship|
      user =  User.find(relationship.follower_id)
      users << user
    end
    users
  end

  def followers(id)
    relationships = Relationship.where(follower_id: id)
    users = []
    relationships.each do |relationship|
      user =  User.find(relationship.following_id)
      users << user
    end
    users
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        name: auth.info.name,
        # image: auth.info.image
        password: Devise.friendly_token[0, 20]
      )
      user.save
      return user
    end

    return user
  end

end

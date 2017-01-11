class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :favorites
  has_many :projects, through: :favorites

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

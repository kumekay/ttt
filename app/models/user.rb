class User < ActiveRecord::Base
  has_many :stuffs

  has_many :wishes, class_name: 'Wish', foreign_key: 'wisher_id'
  has_many :wish_requests, class_name: 'Wish', foreign_key: 'owner_id'
  has_many :likes

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.image = auth['info']['image']
    end
  end

  def self.find_or_create_with_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_with_omniauth(auth)
  end

  def liked_stuff
    self.likes.map {|x| x.stuff }
  end
end

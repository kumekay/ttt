class User < ActiveRecord::Base
  has_many :stuffs
  has_many :buckets
  has_many :likes
  has_many :messages
  
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
    self.likes.map {|x| x.stuff }.compact
  end
end

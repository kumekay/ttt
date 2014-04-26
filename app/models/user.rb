class User < ActiveRecord::Base
  has_many :stuffs

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
end

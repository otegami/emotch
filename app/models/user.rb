class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:nickname]
    image = auth[:info][:image]
    url = auth[:info][:urls][:Twitter]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image = image
      user.url = url
    end
  end
end

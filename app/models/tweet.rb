class Tweet < ApplicationRecord
  belongs_to :user
  has_many :emotions, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 25 }

end

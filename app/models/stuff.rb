class Stuff < ActiveRecord::Base
  belongs_to :user
  has_many :buckets
  has_many :change_buckets, class_name: 'Bucket', foreign_key: 'change_stuff_id'

  acts_as_taggable

  validates :name, :description, :image, :user, presence: true

  mount_uploader :image, ImageUploader

  scope :not_own, ->(user) { where.not(user: user) }
end

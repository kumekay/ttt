class Stuff < ActiveRecord::Base
  belongs_to :user
  has_many :wishers_wishes, class_name: 'Wish', foreign_key: 'wisher_stuff_id'
  has_many :owners_wishes, class_name: 'Wish', foreign_key: 'owner_stuff_id'

  acts_as_taggable

  validates :name, :description, :image, :user, presence: true

  mount_uploader :image, ImageUploader

  scope :not_own, ->(user) { where.not(user: user) }
end

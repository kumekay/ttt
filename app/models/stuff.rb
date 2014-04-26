class Stuff < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  validates :name, :description, :image, :user, presence: true

  mount_uploader :image, ImageUploader

  scope :not_own, ->(user) { where.not(user: user) }
end

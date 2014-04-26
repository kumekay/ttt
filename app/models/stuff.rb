class Stuff < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  validates :name, :description, :image, presence: true

  mount_uploader :image, ImageUploader
end

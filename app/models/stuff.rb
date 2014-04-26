class Stuff < ActiveRecord::Base
  belongs_to :user
  has_many :buckets
  has_many :likes
  has_many :change_buckets, class_name: 'Bucket', foreign_key: 'change_stuff_id'

  acts_as_taggable

  validates :name, :description, :image, :user, presence: true

  mount_uploader :image, ImageUploader

  scope :not_own, ->(user) { where.not(user: user) }

  def liked_by?(user)
    if self.likes.where(user_id: user.id).any?
      true
    else
      false
    end
  end

  def like_matches
    matches = []

    self.user.liked_stuff.each do |my_liked_stuff|
      my_liked_stuff.user.liked_stuff.each do |his_liked_stuff|
        if his_liked_stuff.user.id == self.user.id
          if not matches.include?(my_liked_stuff)
            matches.push(my_liked_stuff)
          end
        end
      end
    end

    matches
  end
end

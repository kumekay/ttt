class Staff < ActiveRecord::Base
  has_and_belongs_to_many :users
  acts_as_taggable

  validates :name, presence: true
end

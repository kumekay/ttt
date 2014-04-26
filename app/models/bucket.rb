class Bucket < ActiveRecord::Base
  belongs_to :user
  belongs_to :stuff
  belongs_to :change_stuff, class_name: 'Stuff'

  validates_uniqueness_of :stuff_id, scope: :user_id
end

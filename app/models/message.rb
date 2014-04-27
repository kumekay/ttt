class Message < ActiveRecord::Base
  default_scope {order( created_at: :desc)}
  belongs_to :user
  belongs_to :receiver, class_name: "User"
  
  validates :user, presence: true
  validates :receiver, presence: true
  validates :body, presence: true
end

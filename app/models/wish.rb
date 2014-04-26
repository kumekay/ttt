class Wish < ActiveRecord::Base
  belongs_to :wisher, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :wisher_stuff, class_name: 'Stuff'
  belongs_to :owner_stuff, class_name: 'Stuff'

  validates_uniqueness_of :owner_stuff_id, scope: [:wisher_id, :owner_id]

  def self.find_wish_by(wish_params)
    find_by(
      wisher_id: wish_params[:wisher_id],
      owner_id: wish_params[:owner_id],
      owner_stuff_id: wish_params[:owner_stuff_id]
    )
  end

  def self.create_wish_by(wish_params)
    create(
      wisher_id: wish_params[:wisher_id],
      owner_id: wish_params[:owner_id],
      owner_stuff_id: wish_params[:owner_stuff_id]
    )
  end
end

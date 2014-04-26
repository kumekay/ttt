class LikesController < ApplicationController
  def like_toggle
    if like = current_user.likes.where(stuff_id: params[:stuff_id]).first
      bucket = Bucket.find_by(user: current_user, stuff_id: params[:stuff_id])
      bucket.destroy
      like.destroy
      render :unlike
    else
      Bucket.create(user: current_user, stuff_id: params[:stuff_id])
      current_user.likes.create!(stuff_id: params[:stuff_id])
      render :like
    end
    # binding.pry
  end
end

class LikesController < ApplicationController
  def like_toggle
    if like = current_user.likes.where(stuff_id: params[:stuff_id]).first
      like.destroy
      render :unlike
    else
      current_user.likes.create!(stuff_id: params[:stuff_id])
      render :like
    end
    # binding.pry
  end
end

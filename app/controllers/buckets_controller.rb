class BucketsController < ApplicationController
  def liking
    if bucket = Bucket.find_by(user: current_user, stuff_id: params[:id])
      bucket.destroy
      @a = 0
    else
      Bucket.create(user: current_user, stuff_id: params[:id])
      @a = 1
    end
  end

  # def my
  #   @stuffs = current_user.stuffs.joins(:buckets).where(change_stuff_id: nil)
  # end

  def approve
    @bucket = Bucket.find(params[:id]).update_attributes(change_stuff_id: params[:change_stuff_id], approve: true)
    redirect_to buckets_approved_path
  end

  def approved
    @buckets = Bucket.where(approve: true).all
  end
end

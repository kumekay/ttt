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

  def approve
    @bucket = Bucket.find(params[:id]).update_attributes(change_stuff_id: params[:change_stuff_id], approve: true)
    redirect_to approved_path
  end

  def approved
    @buckets = Bucket.approved
  end

  def match_approve
    @bucket = Bucket.create(
      user: current_user,
      stuff_id: params[:stuff_id],
      change_stuff_id: params[:change_stuff_id],
      approve: true
    )
    redirect_to approved_path
  end
end

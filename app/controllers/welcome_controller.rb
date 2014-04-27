class WelcomeController < ApplicationController
  def index
    @bucket = current_user.buckets.approved.order('updated_at DESC').last
  end
end

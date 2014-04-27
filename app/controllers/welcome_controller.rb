class WelcomeController < ApplicationController
  skip_before_filter :authorize

  def index
    @bucket = Bucket.approved.order('updated_at DESC').last
  end
end

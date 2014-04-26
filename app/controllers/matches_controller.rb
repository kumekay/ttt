class MatchesController < ApplicationController
  def index
    @stuffs = current_user.stuffs.select { |s| s.likes.count > 0 }
  end
end

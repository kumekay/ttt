class WishesController < ApplicationController
  def list
    # todo: скрыть отказанные
    @wishes = Wish.where(wisher_id: current_user)
  end

  def requests
    @wishes = Wish.where(owner_id: current_user)
  end

  def wish_request
    @wish = Wish.find(params[:id])
  end

  def add_wish
    # если уже есть такой wish - не создавать новый
    if Wish.find_wish_by(wish_params)
      render :empty
    else
      Wish.create_wish_by(wish_params)
    end
  end

  protected

  def wish_params
    params.permit(:wisher_id, :owner_id, :owner_stuff_id)
  end
end

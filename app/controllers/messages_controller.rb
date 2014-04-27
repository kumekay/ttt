class MessagesController < ApplicationController
  def show
    @messages = Message.where(user_id: [current_user.id, params[:id].to_i], receiver_id: [current_user.id, params[:id].to_i])
  end

  def create
    @message = current_user.messages.new(
        user_id: current_user.id,
        receiver_id: params[:id].to_i,
        body: params[:message][:body]
      )
    
    if @message.save
      redirect_to messages_path(id: params[:id].to_i)
    else
      redirect_to messages_path(id: params[:id].to_i)
    end
  end
end

    

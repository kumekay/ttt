class StuffsController < ApplicationController
  before_action :set_stuff, only: %i[edit update]
  skip_before_filter :authorize, only: %i[show index]

  def index
    if params[:tag]
      @stuffs = index_stuff.tagged_with(params[:tag])
    else
      @stuffs = index_stuff
    end
  end

  def tag_cloud
  end

  def change
    @stuff = current_user.stuffs.find(params[:id])
  end

  def my
    @stuffs = current_user.stuffs
  end

  def show
    @stuff = Stuff.find(params[:id])
    render partial: 'stuffs/show_popup'
  end

  def show_popup
    @stuff = Stuff.find(params[:stuff_id])
    render partial: 'stuffs/show_popup'
  end

  def new
    @stuff = Stuff.new
  end

  def edit
  end

  def create
    @stuff = current_user.stuffs.new(stuff_params)
    if @stuff.save
      redirect_to my_stuffs_path
    else
      render :new
    end
  end

  def update
    if @stuff.update(stuff_params)
      redirect_to my_stuffs_path
    else
      render :edit
    end
  end

  def destroy
    #todo:
  end

  def liked
    @stuffs = Stuff.not_own(current_user).liked
  end

  private

  def stuff_params
    params[:stuff].permit(:name, :description, :tag_list, :image)
  end

  def set_stuff
    @stuff = current_user.stuffs.find(params[:id])
  end

  def index_stuff
    current_user ? Stuff.not_own(current_user) : Stuff.all
  end
end

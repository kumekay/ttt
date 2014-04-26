class StuffsController < ApplicationController
  before_action :set_stuff, only: %i[show edit update]
  skip_before_filter :authorize, only: %i[show index]

  def index
    if params[:tag]
      @stuffs = Stuff.tagged_with(params[:tag])
    else
      @stuffs = Stuff.all
    end
  end

  def show
  end

  def new
    @stuff = Stuff.new
  end

  def edit
  end

  def create
    @stuff = current_user.stuffs.new(stuff_params)
    if @stuff.save
      redirect_to @stuff
    else
      render :new
    end
  end

  def update
    if @stuff.update(stuff_params)
      redirect_to @stuff
    else
      render :edit
    end
  end

  def destroy
    #todo:
  end

  private

  def stuff_params
    params[:stuff].permit(:name, :description, :tag_list, :image)
  end

  def set_stuff
    @stuff = current_user.stuffs.find(params[:id])
  end
end

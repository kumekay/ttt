class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit update]
  skip_before_filter :authorize, only: %i[show index]

  def index
    if params[:tag]
      @staffs = Staff.tagged_with(params[:tag])
    else
      @staffs = Staff.all
    end
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to @staff
    else
      render :new
    end
  end

  def update
    if @staff.update(staff_params)
      redirect_to @staff
    else
      render :edit
    end
  end

  def destroy
    #todo:
  end

  private

  def staff_params
    params[:staff].permit(:name, :description, :tag_list, :image)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end

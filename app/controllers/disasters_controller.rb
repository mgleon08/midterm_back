class DisastersController < ApplicationController
  def index
    @disasters = Disaster.page(params[:page]).per(10)
  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = Disaster.new(disaster_params)
    if @disaster.save
      flash[:notice] = "新增成功"
      redirect_to root_path
    else
      flash.now[:alert] = "新增失敗"
      render "new"
    end
  end

  def edit
    @disaster = Disaster.find(params[:id])
  end

  def update
    @disaster = Disaster.find(params[:id])
    if @disaster.update(disaster_params)
      flash[:notice] = "編輯成功"
      redirect_to root_path
    else
      flash.now[:alert] = "編輯失敗"
      render "edit"
    end
  end

  def show
    @disaster = Disaster.find(params[:id])
  end

  def destroy
    @disaster = Disaster.find(params[:id])
    @disaster.destroy
    flash[:notice] = "刪除成功"
    redirect_to root_path
  end
  private

  def disaster_params
    params.require(:disaster).permit(:title,:content,:category_id)
  end
end

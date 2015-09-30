class DisasterCommentsController < ApplicationController

  def new
    @disaster = Disaster.find(params[:disaster_id])
    @comment = @disaster.disaster_comments.new
  end

  def create
    @disaster = Disaster.find(params[:disaster_id])
    @comment = @disaster.disaster_comments.new(disaster_comments_params)
    if @comment.save
      flash[:notice] = "新增成功"
      redirect_to disaster_path(@disaster)
    else
      flash.now[:alert] = "新增失敗"
      render "new"
    end
  end

  def destroy
    @disaster = Disaster.find(params[:disaster_id])
    @comment = @disaster.disaster_comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "刪除成功"
    redirect_to disaster_path(@disaster)
  end

  private

  def disaster_comments_params
    params.require(:disaster_comment).permit(:comment)
  end
end

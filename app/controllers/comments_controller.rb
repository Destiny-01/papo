class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save!

    redirect_to shop_path(@shop)

  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.find(params[:id])
    @comment.destroy
    redirect_to shop_path(@shop)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end

class Public::ItemCommentsController < ApplicationController
  before_action :guest?

  def create
    item = Item.find(params[:item_id])
    comment = current_customer.item_comments.new(item_comment_params)
    comment.item_id = item.id
    comment.save
    @item = Item.find(params[:item_id])
    @item_comment = ItemComment.new
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item_comment = ItemComment.find_by(id: params[:id], item_id: params[:item_id]).destroy
    @item_comment.destroy
  end
  private

  def item_comment_params
    params.require(:item_comment).permit(:comment)
  end

end

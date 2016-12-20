class ItemsController < ApplicationController

  before_action

  def new
    @item = @user.items.new
  end

  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:success] = "Work hard. Don't let it be just a dream."
    else
      flash[:danger] = "Error Saving Item"
    end

    respond_to do |format|
       format.html
       format.js
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.user == current_user
      @item.destroy
      flash.now[:success] = "Your dreams have become reality!"
    else
      flash.now[:alert] = "ToDo couldn't be deleted. Try again."
      redirect_to @user
    end

    respond_to do |format|
       format.html
       format.js
     end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
